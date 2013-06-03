
package classes;

import entidade.ListaDesejoUsuario;
import entidade.Usuario;
import java.util.List;
import javax.ejb.Local;


@Local
public interface InterfaceListaDesejoLocal {
    
    public void incluir(ListaDesejoUsuario produto);
    public void alterar(ListaDesejoUsuario produto);
    public void excluir(ListaDesejoUsuario produto);
    public List<ListaDesejoUsuario> consultar(Usuario pessoa);

}
