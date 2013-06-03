package servlets;

import classes.InterfaceProdutosLocal;
import entidade.Produtos;
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

@WebServlet(name = "ConsultaCatalog", urlPatterns = {"/ConsultaCatalog"})
public class ConsultaCatalog extends HttpServlet {

   
    @EJB
    private InterfaceProdutosLocal ejbProdutos;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            
            List<Produtos> listaProdutosCatalog = (List<Produtos>) request.getSession().getAttribute("listaProdutosCatalog");
                                  
            if (listaProdutosCatalog != null) {
            } else {
                listaProdutosCatalog = new ArrayList<Produtos>();

            }
            


            try {

                 
                if (ejbProdutos.consultarTodos() != null && !ejbProdutos.consultarTodos().isEmpty()) {
                    
                    System.out.println("retets");
                                     
                    listaProdutosCatalog = ejbProdutos.consultarTodos();
                    
                      for (int i = 0; i < listaProdutosCatalog.size(); i++) {
                      //Remove produtos default da lista
                        if (listaProdutosCatalog.get(i).getId()<=10) {
                            listaProdutosCatalog.remove(i);
                            i--;
                            
                        }
                    }
                    request.getSession().setAttribute("listaProdutosCatalog", listaProdutosCatalog);
                    response.sendRedirect(response.encodeRedirectURL("Catalog.jsp"));

                } else {
                    
                        request.getSession().setAttribute("listaProdutosCatalog", null);
                        response.sendRedirect(response.encodeRedirectURL("Catalog.jsp"));

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
