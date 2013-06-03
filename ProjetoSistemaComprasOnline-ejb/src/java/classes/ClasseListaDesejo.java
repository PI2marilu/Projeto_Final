
package classes;


import conexao.ListaDesejoUsuarioFacade;
import entidade.ListaDesejoUsuario;
import entidade.Usuario;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;



@Stateless(mappedName = "ejb/ClasseListaDesejo")
public class ClasseListaDesejo implements InterfaceListaDesejoLocal {
    
    @EJB
    ListaDesejoUsuarioFacade facade;

    @Override
    public void incluir(ListaDesejoUsuario produto) {
        facade.create(produto);
    }

    @Override
    public void alterar(ListaDesejoUsuario produto) {
        facade.edit(produto);
    }

    @Override
    public void excluir(ListaDesejoUsuario produto) {
       facade.remove(produto);
    }

    @Override
    public List<ListaDesejoUsuario> consultar(Usuario pessoa) {
        return facade.consultarLista(pessoa);
    }

  
  

   
}
