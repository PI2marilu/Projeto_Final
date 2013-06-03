package servlets;

import classes.InterfacePedidosLocal;
import entidade.Pedidos;
import entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EfetuarPagamento", urlPatterns = {"/EfetuarPagamento"})
public class EfetuarPagamento extends HttpServlet {

    @EJB
    private InterfacePedidosLocal ejbListaPedidos;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            String idEntrega =  (String) request.getParameter("idEntrega");
           
            try {

                if (ejbListaPedidos.consultar(usuario) != null && !ejbListaPedidos.consultar(usuario).isEmpty()) {

                    List<Pedidos> listaPedidosTemp = ejbListaPedidos.consultar(usuario);


                    for (int j = 0; j < listaPedidosTemp.size(); j++) {

                        Pedidos pedido = new Pedidos();

                        if (listaPedidosTemp.get(j).getStatus().equals("AGUARDANDO PAGAMENTO")) {

                            pedido.setId(listaPedidosTemp.get(j).getId());
                            pedido.setIdProduto(listaPedidosTemp.get(j).getIdProduto());
                            pedido.setIdUsuario(listaPedidosTemp.get(j).getIdUsuario());
                            pedido.setQuantidade(listaPedidosTemp.get(j).getQuantidade());
                            pedido.setValorTotal(listaPedidosTemp.get(j).getValorTotal());
                            pedido.setData(listaPedidosTemp.get(j).getData());
                            pedido.setEstado(usuario.getEstado());
                            pedido.setStatus("AGUARDANDO APROVAÇÃO");
                            
                              
                              
                            if(idEntrega.equals("meuEndereco")){
                             pedido.setEndereco(usuario.getEndereco1()+","+ usuario.getNumero1()+", CEP:" + usuario.getCep());   
                            }
                             if(idEntrega.equals("amigoEndereco")){
                             pedido.setEndereco(usuario.getEndereco2()+","+ usuario.getNumero2()+", CEP:" + usuario.getCep2());
                            }

                            ejbListaPedidos.alterar(pedido);


                        }
                    }

                    response.sendRedirect(response.encodeRedirectURL("ConsultaPedidos"));


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
