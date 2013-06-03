
package servlets;

import classes.InterfaceUsuarioLocal;
import entidade.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AtualizarPerfil", urlPatterns = {"/AtualizarPerfil"})
public class AtualizarPerfil extends HttpServlet {

    
@EJB
    private InterfaceUsuarioLocal ejbUsuario;
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Usuario usuarioSessao = (Usuario) request.getSession().getAttribute("usuario");
               
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
            
            
            Usuario usuario = new Usuario();
            usuario.setId(usuarioSessao.getId());
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
            
            if(!senha.trim().equals("")){
            usuario.setSenha(senha);
            }else{
            usuario.setSenha(usuarioSessao.getSenha());
            }
            
            
             try {
                 
                  if (!usuarioSessao.getEmail().equals(usuario.getEmail()) && ejbUsuario.consultar(usuario) != null) {

                    response.sendRedirect(response.encodeRedirectURL("UsuarioExistente.jsp"));
                } else {

                ejbUsuario.alterar(usuario);
                request.getSession().setAttribute("usuario", usuario);
                response.sendRedirect(response.encodeRedirectURL("AtualizadoSucesso.jsp"));

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
