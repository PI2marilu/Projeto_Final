
package conexao;

import entidade.Produtos;
import entidade.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

@Stateless
public class ProdutosFacade extends AbstractFacade<Produtos> {
    @PersistenceContext(unitName = "ProjetoSistemaComprasOnline-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ProdutosFacade() {
        super(Produtos.class);
    }
    
     public Produtos consultarProduto(Produtos produto) {

        try {
            return (Produtos) em.createQuery("SELECT OBJECT(u) FROM Produtos u  WHERE  u.id='" + produto.getId() + "'").getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
     
     public List<Produtos> consultarTodosProduto() {

        try {
            return (List<Produtos>) em.createQuery("SELECT OBJECT(u) FROM Produtos u ").getResultList();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
     
     
     
   
    
    
}
