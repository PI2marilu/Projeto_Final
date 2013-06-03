
package conexao;

import entidade.MeuCarrinho;
import entidade.Usuario;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class MeuCarrinhoFacade extends AbstractFacade<MeuCarrinho> {
    @PersistenceContext(unitName = "ProjetoSistemaComprasOnline-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public MeuCarrinhoFacade() {
        super(MeuCarrinho.class);
    }
    
    public List<MeuCarrinho> consultarMeuCarrinho(Usuario pessoa) {

        try {
            return (List<MeuCarrinho>) em.createQuery("SELECT OBJECT(u) FROM MeuCarrinho u WHERE  u.idUsuario='" + pessoa.getId() + "' order by u.id desc").getResultList();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
}
