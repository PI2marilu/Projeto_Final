
package conexao;

import entidade.Pedidos;
import entidade.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class PedidosFacade extends AbstractFacade<Pedidos> {
    @PersistenceContext(unitName = "ProjetoSistemaComprasOnline-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public PedidosFacade() {
        super(Pedidos.class);
    }
    
     public List<Pedidos> consultarPedidos(Usuario pessoa) {

        try {
            return (List<Pedidos>) em.createQuery("SELECT OBJECT(u) FROM Pedidos u WHERE  u.idUsuario='" + pessoa.getId() + "' order by u.id desc").getResultList();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
     
   
      public Pedidos consultarPedidos(Pedidos pen) {

        try {
            return (Pedidos) em.createQuery("SELECT OBJECT(u) FROM Pedidos u WHERE u.id='"  + pen.getId()+"'").getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
      
       public Pedidos consultarPedidosFilial(Pedidos pen) {

        try {
            return (Pedidos) em.createQuery("SELECT OBJECT(u) FROM Pedidos u WHERE u.id='"  + pen.getId()+  "' and u.filialentrega ='" + pen.getFilialentrega()+"'").getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
