/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import entidade.Vendas;
import javax.ejb.Remote;
@Remote
public interface InterfaceVendasRemote {
    public void incluir(Vendas ven);
    public void alterar(Vendas ven);
    public void excluir(Vendas ven);
    public Vendas consultarVendas(Vendas ven);
    
}
