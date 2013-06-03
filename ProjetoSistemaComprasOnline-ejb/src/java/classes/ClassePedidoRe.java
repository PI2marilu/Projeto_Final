/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import conexao.PedidosFacade;
import entidade.Pedidos;
import entidade.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;



@Stateless(mappedName = "ejb/ClassePedidoRe")
public class ClassePedidoRe implements InterfacePedidosRemote{
    @EJB
    PedidosFacade facade;

    @Override
    public void incluir(Pedidos pedido) {
        facade.create(pedido);
    }

    @Override
    public void alterar(Pedidos pedido) {
          facade.edit(pedido);
    }

    @Override
    public void excluir(Pedidos pedido) {
         facade.remove(pedido);

    }

    @Override
    public List<Pedidos> consultar(Usuario pessoa) {
        return facade.consultarPedidos(pessoa);
    }
    
   
    @Override 
    public Pedidos consultarPedidos(Pedidos ped){
        return facade.consultarPedidos(ped);
    }
    @Override
     public Pedidos consultarPedidosFilial (Pedidos ped){
       return facade.consultarPedidosFilial(ped);
    }
}
