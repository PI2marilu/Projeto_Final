/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;
import entidade.Pedidos;
import entidade.Usuario;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Remote;
@Remote
public interface InterfacePedidosRemote {
    public void incluir(Pedidos pedido);
    public void alterar(Pedidos pedido);
    public void excluir(Pedidos pedido);
    public List<Pedidos> consultar(Usuario pessoa);
    public Pedidos consultarPedidos(Pedidos ped);
    public Pedidos consultarPedidosFilial (Pedidos ped);
}
