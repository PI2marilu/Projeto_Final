
package classes;

import conexao.UsuarioFacade;
import entidade.Usuario;
import javax.ejb.EJB;
import javax.ejb.Stateless;

@Stateless(mappedName = "ejb/ClasseUsuario")
public class ClasseUsuario implements InterfaceUsuarioLocal { 
    
    @EJB
    UsuarioFacade facade;

    @Override
    public void incluir(Usuario pessoa) {
        facade.create(pessoa);
    }

    @Override
    public void alterar(Usuario pessoa) {
        facade.edit(pessoa);
    }

    @Override
    public void excluir(Usuario pessoa) {
        facade.remove(pessoa);
    }

    @Override
    public Usuario consultar(Usuario pessoa) {
        return facade.consultarEmail(pessoa.getEmail());
    }

    @Override
    public Usuario consultarLogin(Usuario pessoa) {
        return facade.consultarEmailSenha(pessoa.getEmail(), pessoa.getSenha());
    }
    
}
