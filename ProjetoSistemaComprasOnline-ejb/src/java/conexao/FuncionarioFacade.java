/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package conexao;

import entidade.Funcionario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;



@Stateless

public class FuncionarioFacade extends AbstractFacade<Funcionario>{

     @PersistenceContext(unitName = "ProjetoSistemaComprasOnline-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FuncionarioFacade() {
        super(Funcionario.class);
    }
    
    public Funcionario consultar(String cpf) {

        try {
            return (Funcionario) em.createQuery("SELECT OBJECT(u) FROM Funcionario u  WHERE  u.cpf='" + cpf + "'").getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
     public Funcionario consultarLogin(String cpf, String senha) {

        try {
            return (Funcionario) em.createQuery("SELECT OBJECT(u) FROM Funcionario u  WHERE  u.cpf='" + cpf + "' and u.senha ='" + senha  +"'").getSingleResult();
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

}
