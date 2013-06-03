
package conexao;

import entidade.Usuario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class UsuarioFacade extends AbstractFacade<Usuario> {
    @PersistenceContext(unitName = "ProjetoSistemaComprasOnline-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public UsuarioFacade() {
        super(Usuario.class);
    }
    
    public Usuario consultarEmail(String email) {

        try {
            return (Usuario) em.createQuery("SELECT OBJECT(u) FROM Usuario u  WHERE  u.email='" + email + "'").getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
     public Usuario consultarEmailSenha(String email, String senha) {

        try {
            return (Usuario) em.createQuery("SELECT OBJECT(u) FROM Usuario u  WHERE  u.email='" + email + "' and u.senha ='" + senha + "'").getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
}
