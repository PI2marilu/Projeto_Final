/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import conexao.VendasFacade;
import entidade.Vendas;
import javax.ejb.EJB;
import javax.ejb.Remote;
import javax.ejb.Stateless;
@Remote
@Stateless(mappedName = "ejb/ClasseVendas")
public class ClasseVendas implements InterfaceVendasRemote{
    
    @EJB
    VendasFacade facade;

    @Override
    public void incluir(Vendas ven) {
        facade.create(ven);
    }

    @Override
    public void alterar(Vendas ven) {
        facade.edit(ven);
    }

    @Override
    public void excluir(Vendas ven) {
        facade.remove(ven);
    }

    @Override
    public Vendas consultarVendas(Vendas ven) {
        return facade.consultarVendas(ven.getDia(),ven.getMes());
    }

   

    
}
