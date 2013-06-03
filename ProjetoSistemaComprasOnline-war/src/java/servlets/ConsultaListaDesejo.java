
package servlets;

import classes.InterfaceListaDesejoLocal;
import classes.InterfaceProdutosLocal;
import entidade.ListaDesejoUsuario;
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

@WebServlet(name = "ConsultaListaDesejo", urlPatterns = {"/ConsultaListaDesejo"})
public class ConsultaListaDesejo extends HttpServlet {

 
    @EJB
    private InterfaceListaDesejoLocal ejbListaDesejo;
     @EJB
    private InterfaceProdutosLocal ejbProdutos;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
             List<Produtos> listaProdutos = (List<Produtos>) request.getSession().getAttribute("listaProdutos");
            
             if (listaProdutos != null) {
            } else {
                listaProdutos = new ArrayList<Produtos>();

            }
     


            try {
               
                            
                if (ejbListaDesejo.consultar(usuario) != null) {
                    
                 

                    List<ListaDesejoUsuario> listaDesejo = new ArrayList<ListaDesejoUsuario>();
                    listaDesejo = ejbListaDesejo.consultar(usuario);
                    request.getSession().setAttribute("listaDesejoSessao", listaDesejo);
                   
                    
                     for (int i = 0; i < listaDesejo.size(); i++) {
                            Produtos produto = new Produtos();
                            produto.setId(Long.parseLong(listaDesejo.get(i).getIdProduto()));
                            
                            if (ejbProdutos.consultar(produto) != null) {
                            listaProdutos.add(ejbProdutos.consultar(produto));
                            request.getSession().setAttribute("listaProdutos", listaProdutos);
                            }
                     }
                     
                      response.sendRedirect(response.encodeRedirectURL("ListaDesejos.jsp"));
                    
                } else {

                   request.getSession().setAttribute("listaDesejoSessao", null);
                   response.sendRedirect(response.encodeRedirectURL("ListaDesejos.jsp"));

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
