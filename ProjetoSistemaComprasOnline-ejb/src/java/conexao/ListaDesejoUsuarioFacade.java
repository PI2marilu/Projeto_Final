
package conexao;

import entidade.ListaDesejoUsuario;
import entidade.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class ListaDesejoUsuarioFacade extends AbstractFacade<ListaDesejoUsuario> {
    @PersistenceContext(unitName = "ProjetoSistemaComprasOnline-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ListaDesejoUsuarioFacade() {
        super(ListaDesejoUsuario.class);
    }
    
     public List<ListaDesejoUsuario> consultarLista(Usuario pessoa) {

        try {
            return (List<ListaDesejoUsuario>) em.createQuery("SELECT OBJECT(u) FROM ListaDesejoUsuario u WHERE  u.idUsuario='" + pessoa.getId() + "'").getResultList();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    
}
