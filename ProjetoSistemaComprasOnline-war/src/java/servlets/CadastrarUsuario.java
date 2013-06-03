package servlets;


import classes.InterfaceListaDesejoLocal;
import classes.InterfaceMeuCarrinhoLocal;
import classes.InterfaceProdutosLocal;
import classes.InterfaceUsuarioLocal;
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

@WebServlet(name = "CadastrarUsuario", urlPatterns = {"/CadastrarUsuario"})
public class CadastrarUsuario extends HttpServlet {

    @EJB
    private InterfaceUsuarioLocal ejbUsuario;
    
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
           // nome, cpf, sexo, apelido, email, senha, cidade,estado,cep,endereco1,numero1,complemento1,endereco2,numero2,complemento2;

            String nome = (String) request.getParameter("Nome");
            String cpf = (String) request.getParameter("CPF");
            String sexo = (String) request.getParameter("Sexo");
            String apelido = (String) request.getParameter("Apelido");
            String email = (String) request.getParameter("Email");
            String senha = (String) request.getParameter("Senha");
            String cidade = (String) request.getParameter("Cidade");
            String estado = (String) request.getParameter("Estado");
            String cep = (String) request.getParameter("CEP");
            String endereco1 = (String) request.getParameter("Endereco1");
            String numero1 = (String) request.getParameter("Numero1");
            String complemento1 = (String) request.getParameter("Complemento1");
            String cep2 = (String) request.getParameter("CEP2");
            String endereco2 = (String) request.getParameter("Endereco2");
            String numero2 = (String) request.getParameter("Numero2");
            String complemento2 = (String) request.getParameter("Complemento2");
            
           
            
            String idProduto = (String) request.getSession().getAttribute("idProduto");
            String idProcesso = (String) request.getSession().getAttribute("idProcesso");
            String quantidade = (String) request.getSession().getAttribute("quantidade");
            String valor = (String) request.getSession().getAttribute("valor");
            List<Produtos> listaProdutos = (List<Produtos>) request.getSession().getAttribute("listaProdutos");
            
            boolean ProdutoExistente = false;
            boolean ProdutoExistente1 = false;
            boolean ProdutoExistente2 = false;
            int itens = 0;
            int itensTotal = 0;
            
            if (listaProdutos != null) {
            } else {
                listaProdutos = new ArrayList<Produtos>();

            }

            

            Usuario usuario = new Usuario();
            usuario.setNome(nome);
            usuario.setCpf(cpf);
            usuario.setSexo(sexo);
            usuario.setApelido(apelido);
            usuario.setEmail(email);
            usuario.setSenha(senha);
            usuario.setCidade(cidade);
            usuario.setEstado(estado);
            usuario.setCep(cep);
            usuario.setEndereco1(endereco1);
            usuario.setNumero1(numero1);
            usuario.setComplemento1(complemento1);
            usuario.setCep2(cep2);
            usuario.setEndereco2(endereco2);
            usuario.setNumero2(numero2);
            usuario.setComplemento2(complemento2);
                    
                    

            try {


                if (ejbUsuario.consultar(usuario) != null) {

                    response.sendRedirect(response.encodeRedirectURL("UsuarioExistente.jsp"));
                } else {

                    ejbUsuario.incluir(usuario);
                    
                    
                    
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
                                    }  else{
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
                                    response.sendRedirect(response.encodeRedirectURL("CadastroSucesso.jsp"));
                                } else {
                                    response.sendRedirect(response.encodeRedirectURL("CadastroSucesso.jsp"));
                                }
                            }

                            request.getSession().setAttribute("usuario", usuario);
                           

                        }
                        
                   
                         if (idProcesso.equals("carrinho")) {
                             
                           
                            
                             MeuCarrinho meucarrinho = new MeuCarrinho();
                            meucarrinho.setIdProduto(idProduto);
                            meucarrinho.setIdUsuario(String.valueOf(usuario.getId()));
                            meucarrinho.setQuantidade(Integer.parseInt(quantidade));
                            meucarrinho.setValorTotal(valor);
                            
                           
                            if (ejbMeuCarrinho.consultar(usuario) != null) {
                            List<MeuCarrinho> listaMeuCarrinho = new ArrayList<MeuCarrinho>();
                            listaMeuCarrinho = ejbMeuCarrinho.consultar(usuario); 
                            
                                    
                                for (int i = 0; i < listaMeuCarrinho.size(); i++){
                                    if(idProduto.equals(listaMeuCarrinho.get(i).getIdProduto())){
                                        ProdutoExistente1 = true;
                                        meucarrinho.setId(listaMeuCarrinho.get(i).getId());
                                        meucarrinho.setQuantidade(listaMeuCarrinho.get(i).getQuantidade()+ Integer.parseInt(quantidade));
                                        String totalQuantidade = String.valueOf(listaMeuCarrinho.get(i).getQuantidade() + Integer.parseInt(quantidade)) ;
                                        meucarrinho.setValorTotal(String.valueOf(Double.parseDouble(totalQuantidade)* (Double.parseDouble(listaMeuCarrinho.get(i).getValorTotal())/ (Double.parseDouble(totalQuantidade) - 1) ) ));
                                        break;
                                    }else{
                                        ProdutoExistente1 = false;
                                    }
                                }
                                
                                if (listaMeuCarrinho != null && !listaMeuCarrinho.isEmpty()) {
                                        for (int i = 0; i < listaMeuCarrinho.size(); i++) {
                                            itens = listaMeuCarrinho.get(i).getQuantidade();
                                            itensTotal = itensTotal + itens;
                                        }
                                        request.getSession().setAttribute("itensTotal", itensTotal);
                                    }
                                
                                if(ProdutoExistente1==false){
                                    ejbMeuCarrinho.incluir(meucarrinho);
                                      response.sendRedirect(response.encodeRedirectURL("CadastroSucesso.jsp"));
                                }else{
                                    ejbMeuCarrinho.alterar(meucarrinho);
                                      response.sendRedirect(response.encodeRedirectURL("CadastroSucesso.jsp"));
                                }
                            }
                         
                                    
                            request.getSession().setAttribute("usuario", usuario);
                            
                            
                           
                        }
                             

                    } else {
                        response.sendRedirect(response.encodeRedirectURL("CadastroSucesso.jsp"));
                    }
                    
                  

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
