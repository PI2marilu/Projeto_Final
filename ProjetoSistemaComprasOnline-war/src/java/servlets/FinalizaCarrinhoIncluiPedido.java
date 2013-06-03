package servlets;

import classes.InterfaceMeuCarrinhoLocal;
import classes.InterfacePedidosLocal;
import classes.InterfaceProdutosLocal;
import entidade.MeuCarrinho;
import entidade.Pedidos;
import entidade.Produtos;
import entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FinalizaCarrinhoIncluiPedido", urlPatterns = {"/FinalizaCarrinhoIncluiPedido"})
public class FinalizaCarrinhoIncluiPedido extends HttpServlet {

    @EJB
    private InterfacePedidosLocal ejbListaPedidos;
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
            List<MeuCarrinho> listaMeuCarrinho = (List<MeuCarrinho>) request.getSession().getAttribute("listaMeuCarrinho");
            List<Pedidos> listaPedidos = (List<Pedidos>) request.getSession().getAttribute("listaPedidos");

            if (listaPedidos != null) {
            } else {
                listaPedidos = new ArrayList<Pedidos>();

            }
            
            
            if (listaProdutos != null) {
            } else {
                listaProdutos = new ArrayList<Produtos>();

            }
            


            try {

                 
                if (ejbListaPedidos.consultar(usuario) != null && !ejbListaPedidos.consultar(usuario).isEmpty()) {
                    
                     if (listaMeuCarrinho != null && !listaMeuCarrinho.isEmpty()) {
                       

                        Pedidos pedido = new Pedidos();
                        
                        Date date = new Date();
                        
                        boolean Existe = false;
                        
                       
                        for (int i = 0; i < listaMeuCarrinho.size(); i++) {
                            
                            
                            pedido.setIdProduto(listaMeuCarrinho.get(i).getIdProduto());
                            pedido.setIdUsuario(listaMeuCarrinho.get(i).getIdUsuario());
                            pedido.setQuantidade(listaMeuCarrinho.get(i).getQuantidade());
                            pedido.setValorTotal(listaMeuCarrinho.get(i).getValorTotal());
                            pedido.setData(date);
                            pedido.setEstado(usuario.getEstado());
                            pedido.setStatus("AGUARDANDO PAGAMENTO");
                            
                             List<Pedidos> listaPedidosTemp = ejbListaPedidos.consultar(usuario);
                            
                            for(int j = 0; j < listaPedidosTemp.size(); j++){
                                
                                if(String.valueOf(String.valueOf(listaPedidosTemp.get(j).getData()).substring(0, 10)+String.valueOf(listaPedidosTemp.get(j).getData()).substring(20)).equals(String.valueOf(String.valueOf(pedido.getData()).substring(0, 10)+String.valueOf(pedido.getData()).substring(20))) &&
                                   listaPedidosTemp.get(j).getIdProduto().equals(listaMeuCarrinho.get(i).getIdProduto()) &&
                                     listaPedidosTemp.get(j).getStatus().equals("AGUARDANDO PAGAMENTO")){
                                    
                                     
                                     pedido.setId(listaPedidosTemp.get(j).getId());
                                     pedido.setIdProduto(listaPedidosTemp.get(j).getIdProduto());
                                     pedido.setQuantidade(listaPedidosTemp.get(j).getQuantidade()+pedido.getQuantidade());
                                     pedido.setValorTotal(String.valueOf(Double.parseDouble(listaPedidosTemp.get(j).getValorTotal())+Double.parseDouble(pedido.getValorTotal())));
                                     pedido.setEstado(usuario.getEstado());
                                     ejbListaPedidos.alterar(pedido);
                                     Existe = true;
                                     break;
                                     
                                    
                                }
                            }
                            
                            if(Existe == false){
                               
                                     ejbListaPedidos.incluir(pedido);
                                    
                                
                            }else{
                                
                                Existe = false;
                                
                            }
                            
                           
                            
                            //Exclui do meu carrinho apos incluir o pedido
                            MeuCarrinho meucarrinho = new MeuCarrinho();
                            meucarrinho.setId(listaMeuCarrinho.get(i).getId());
                            ejbMeuCarrinho.excluir(meucarrinho);
                            request.getSession().setAttribute("itensTotal", 0);

                        }
                        request.getSession().setAttribute("listaMeuCarrinho", null);
                    }

                   
                    listaPedidos = ejbListaPedidos.consultar(usuario);
                    request.getSession().setAttribute("listaPedidos", listaPedidos);
                    

                    for (int i = 0; i < listaPedidos.size(); i++) {
                        
                        Produtos produto = new Produtos();
                        produto.setId(Long.parseLong(listaPedidos.get(i).getIdProduto()));

                        if (ejbProdutos.consultar(produto) != null) {
                            listaProdutos.add(ejbProdutos.consultar(produto));
                            request.getSession().setAttribute("listaProdutos", listaProdutos);
                        }
                    }
                    
                    response.sendRedirect(response.encodeRedirectURL("Pedidos.jsp"));

                } else {
                        
                      if (ejbMeuCarrinho.consultar(usuario) != null && !ejbMeuCarrinho.consultar(usuario).isEmpty()) {

                         
                    listaMeuCarrinho = new ArrayList<MeuCarrinho>();
                    listaMeuCarrinho  = ejbMeuCarrinho.consultar(usuario);
                    request.getSession().setAttribute("listaMeuCarrinho", listaMeuCarrinho);
                    
                      }

                    if (listaMeuCarrinho != null && !listaMeuCarrinho.isEmpty()) {
                       

                        Pedidos pedido = new Pedidos();
                        
                        Date date = new Date();
                       
                        for (int i = 0; i < listaMeuCarrinho.size(); i++) {
                            pedido.setIdProduto(listaMeuCarrinho.get(i).getIdProduto());
                            pedido.setIdUsuario(listaMeuCarrinho.get(i).getIdUsuario());
                            pedido.setQuantidade(listaMeuCarrinho.get(i).getQuantidade());
                            pedido.setValorTotal(listaMeuCarrinho.get(i).getValorTotal());
                            pedido.setData(date);
                            pedido.setEstado(usuario.getEstado());
                            pedido.setStatus("AGUARDANDO PAGAMENTO");
                            ejbListaPedidos.incluir(pedido);
                            listaPedidos.add(pedido);
                            
                            //Exclui do meu carrinho apos incluir o pedido
                            MeuCarrinho meucarrinho = new MeuCarrinho();
                            meucarrinho.setId(listaMeuCarrinho.get(i).getId());
                            ejbMeuCarrinho.excluir(meucarrinho);
                            request.getSession().setAttribute("itensTotal", 0);

                        }
                         
                         request.getSession().setAttribute("listaMeuCarrinho", null);
                         request.getSession().setAttribute("listaPedidos", listaPedidos);
                    } else {
                        request.getSession().setAttribute("listaPedidos", null);
                    }



                    response.sendRedirect(response.encodeRedirectURL("Pedidos.jsp"));

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
