/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexao;

import entidade.Vendas;
import java.util.Date;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


@Stateless
public class VendasFacade extends AbstractFacade<Vendas> {
    @PersistenceContext(unitName = "ProjetoSistemaComprasOnline-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public VendasFacade() {
        super(Vendas.class);
    }
     public Vendas consultarVendas(int dia, int mes) {

        try {
            return (Vendas) em.createQuery("SELECT OBJECT(u) FROM Vendas u  WHERE  u.dia='" + dia + "' and u.mes ='" + mes + "'").getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}
