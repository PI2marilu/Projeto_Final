
package classes;

import entidade.Usuario;
import javax.ejb.Local;

@Local
public interface InterfaceUsuarioLocal {
    
    public void incluir(Usuario pessoa);
    public void alterar(Usuario pessoa);
    public void excluir(Usuario pessoa);
    public Usuario consultar(Usuario pessoa);
    public Usuario consultarLogin(Usuario pessoa);
}
