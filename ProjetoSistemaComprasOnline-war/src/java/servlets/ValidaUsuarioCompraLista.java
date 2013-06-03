package servlets;

import classes.InterfaceListaDesejoLocal;
import classes.InterfaceMeuCarrinhoLocal;
import classes.InterfaceProdutosLocal;
import entidade.ListaDesejoUsuario;
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

@WebServlet(name = "ValidaUsuarioCompraLista", urlPatterns = {"/ValidaUsuarioCompraLista"})
public class ValidaUsuarioCompraLista extends HttpServlet {

    @EJB
    private InterfaceListaDesejoLocal ejbListaDesejo;
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
            String idProduto = (String) request.getParameter("idProduto");
            String idProcesso = (String) request.getParameter("idProcesso");
            String quantidade = (String) request.getParameter("quantidade");
            String valor = (String) request.getParameter("valor");
            List<Produtos> listaProdutos = (List<Produtos>) request.getSession().getAttribute("listaProdutos");
            boolean ProdutoExistente = false;
            boolean ProdutoExistente1 = false;
            boolean ProdutoExistente2 = false;
            boolean Continua = false;
            int itens = 0;
            int itensTotal = 0;



            if (listaProdutos != null) {
            } else {
                listaProdutos = new ArrayList<Produtos>();

            }






            try {



                if (usuario != null) {

                    if (idProduto != null && idProcesso != null && quantidade != null && valor != null) {


                        //Verifica se produto está na base de dados
                        Produtos produto = new Produtos();
                        produto.setId(Long.parseLong(idProduto));


                        for (int i = 0; i < listaProdutos.size(); i++) {
                            if (listaProdutos.get(i).getId() == produto.getId()) {
                                ProdutoExistente2 = true;
                                break;
                            }


                        }
                        if (ProdutoExistente2 == false) {

                            if (Long.parseLong(idProduto) <= 10) {


                                if (ejbProdutos.consultar(produto) == null) {
                                   
                                    produto.setPreco(valor);
                                    produto.setModelo("Sunglasses Model");
                                    produto.setEstoque1(10);
                                    produto.setEstoque2(10);
                                    produto.setDescricao("Sed at fringilla est. Donec ac mi augue. Mauris id sem at felis sollicitudin sollicitudin.");
                                    ejbProdutos.incluir(produto);

                                    listaProdutos.add(produto);
                                    request.getSession().setAttribute("listaProdutos", listaProdutos);
                                } else {
                                    listaProdutos.add(ejbProdutos.consultar(produto));
                                    request.getSession().setAttribute("listaProdutos", listaProdutos);
                                }
                            } else {
                                listaProdutos.add(ejbProdutos.consultar(produto));
                                request.getSession().setAttribute("listaProdutos", listaProdutos);
                            }



                        } else {

                            ProdutoExistente2 = false;
                        }


                        //Fim produto




                        if (idProcesso.equals("desejo")) {

                            ListaDesejoUsuario listaDesejo = new ListaDesejoUsuario();
                            listaDesejo.setIdProduto(idProduto);
                            listaDesejo.setIdUsuario(String.valueOf(usuario.getId()));


                            if (ejbListaDesejo.consultar(usuario) != null) {
                                List<ListaDesejoUsuario> listaDesejoSessao = new ArrayList<ListaDesejoUsuario>();
                                listaDesejoSessao = ejbListaDesejo.consultar(usuario);
                                for (int i = 0; i < listaDesejoSessao.size(); i++) {
                                    if (idProduto.equals(listaDesejoSessao.get(i).getIdProduto())) {
                                        ProdutoExistente = true;
                                        break;
                                    } else {
                                        ProdutoExistente = false;
                                    }
                                }


                                if (ProdutoExistente == false) {
                                    ejbListaDesejo.incluir(listaDesejo);
                                    response.sendRedirect(response.encodeRedirectURL("ConsultaListaDesejo"));
                                } else {
                                    response.sendRedirect(response.encodeRedirectURL("ConsultaListaDesejo"));
                                }
                            }


                            request.getSession().setAttribute("usuario", usuario);

                        }




                        if (idProcesso.equals("carrinho")) {


                            Produtos produtoEstoque = new Produtos();
                            if (ejbProdutos.consultar(produto) != null) {
                                produtoEstoque = ejbProdutos.consultar(produto);
                            }


                            MeuCarrinho meucarrinho = new MeuCarrinho();
                            meucarrinho.setIdProduto(idProduto);
                            meucarrinho.setIdUsuario(String.valueOf(usuario.getId()));
                            meucarrinho.setQuantidade(Integer.parseInt(quantidade));
                            meucarrinho.setValorTotal(valor);


                            if (ejbMeuCarrinho.consultar(usuario) != null) {
                                List<MeuCarrinho> listaMeuCarrinho = new ArrayList<MeuCarrinho>();
                                listaMeuCarrinho = ejbMeuCarrinho.consultar(usuario);


                                for (int i = 0; i < listaMeuCarrinho.size(); i++) {




                                    if (idProduto.equals(listaMeuCarrinho.get(i).getIdProduto())) {

                                        //Verifica ESTOQUE
                                        if (produtoEstoque.getEstoque1()+ produtoEstoque.getEstoque2() >= listaMeuCarrinho.get(i).getQuantidade() + Integer.parseInt(quantidade)) {


                                            ProdutoExistente1 = true;
                                            meucarrinho.setId(listaMeuCarrinho.get(i).getId());
                                            meucarrinho.setQuantidade(listaMeuCarrinho.get(i).getQuantidade() + Integer.parseInt(quantidade));
                                            String totalQuantidade = String.valueOf(listaMeuCarrinho.get(i).getQuantidade() + Integer.parseInt(quantidade));
                                            meucarrinho.setValorTotal(String.valueOf(Double.parseDouble(totalQuantidade) * (Double.parseDouble(listaMeuCarrinho.get(i).getValorTotal()) / (Double.parseDouble(totalQuantidade) - 1))));
                                            break;
                                        } else {
                                            Continua = true;
                                            response.sendRedirect(response.encodeRedirectURL("EstoqueNaoSuportado.jsp"));
                                            break;
                                        }
                                    } else {
                                        ProdutoExistente1 = false;


                                    }
                                }

                                if (listaMeuCarrinho != null && !listaMeuCarrinho.isEmpty() && Continua == false) {
                                    for (int i = 0; i < listaMeuCarrinho.size(); i++) {
                                        itens = listaMeuCarrinho.get(i).getQuantidade();
                                        itensTotal = itensTotal + itens;
                                    }
                                    request.getSession().setAttribute("itensTotal", itensTotal);
                                }
                                if (ProdutoExistente1 == false && Continua == false) {
                                    if (produtoEstoque.getEstoque1()+ produtoEstoque.getEstoque2() >= Integer.parseInt(quantidade)) {
                                        ejbMeuCarrinho.incluir(meucarrinho);
                                        response.sendRedirect(response.encodeRedirectURL("ConsultaMeuCarrinho"));
                                    } else {
                                        response.sendRedirect(response.encodeRedirectURL("EstoqueNaoSuportado.jsp"));
                                    }


                                }
                                if (ProdutoExistente1 == true && Continua == false) {

                                    ejbMeuCarrinho.alterar(meucarrinho);
                                    response.sendRedirect(response.encodeRedirectURL("ConsultaMeuCarrinho"));
                                }
                            }


                            request.getSession().setAttribute("usuario", usuario);



                        }

                    } else {
                        response.sendRedirect(response.encodeRedirectURL("UsuarioInexistente.jsp"));
                    }

                } else {

                    request.getSession().setAttribute("idProduto", idProduto);
                    request.getSession().setAttribute("idProcesso", idProcesso);
                    request.getSession().setAttribute("quantidade", quantidade);
                    request.getSession().setAttribute("valor", valor);
                    response.sendRedirect(response.encodeRedirectURL("Login.jsp"));
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
