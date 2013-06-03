package servlets;

import classes.InterfaceMeuCarrinhoLocal;
import classes.InterfaceProdutosLocal;
import entidade.MeuCarrinho;
import entidade.Produtos;
import entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ConsultaMeuCarrinho", urlPatterns = {"/ConsultaMeuCarrinho"})
public class ConsultaMeuCarrinho extends HttpServlet {

    @EJB
    private InterfaceMeuCarrinhoLocal ejbMeuCarrinho;
    @EJB
    private InterfaceProdutosLocal ejbProdutos;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            List<Produtos> listaProdutos = (List<Produtos>) request.getSession().getAttribute("listaProdutos");
            int itens = 0;
            int itensTotal = 0;
            
             if (listaProdutos != null) {
            } else {
                listaProdutos = new ArrayList<Produtos>();

            }



            try {


                if (ejbMeuCarrinho.consultar(usuario) != null && !ejbMeuCarrinho.consultar(usuario).isEmpty()) {



                    List<MeuCarrinho> meucarrinho = new ArrayList<MeuCarrinho>();
                    meucarrinho = ejbMeuCarrinho.consultar(usuario);
                    request.getSession().setAttribute("listaMeuCarrinho", meucarrinho);


                    if (meucarrinho != null && !meucarrinho.isEmpty()) {

                        for (int i = 0; i < meucarrinho.size(); i++) {
                            itens = meucarrinho.get(i).getQuantidade();
                            itensTotal = itensTotal + itens;
                            
                            Produtos produto = new Produtos();
                            produto.setId(Long.parseLong(meucarrinho.get(i).getIdProduto()));
                            
                            if (ejbProdutos.consultar(produto) != null) {
                            listaProdutos.add(ejbProdutos.consultar(produto));
                            request.getSession().setAttribute("listaProdutos", listaProdutos);
                            }
                        }
                        request.getSession().setAttribute("itensTotal", itensTotal);

                        
                    }

                    response.sendRedirect(response.encodeRedirectURL("MeuCarrinho.jsp"));
                } else {

                    request.getSession().setAttribute("listaMeuCarrinho", null);
                    request.getSession().setAttribute("itensTotal", 0);

                    response.sendRedirect(response.encodeRedirectURL("MeuCarrinho.jsp"));

                }


            } catch (Exception ex) {
                ex.printStackTrace();
                response.sendRedirect(response.encodeRedirectURL("UsuarioInexistente.jsp"));
            }

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
