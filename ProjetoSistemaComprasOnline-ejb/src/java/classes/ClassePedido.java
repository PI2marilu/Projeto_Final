
package classes;

import conexao.PedidosFacade;
import entidade.Pedidos;
import entidade.Usuario;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;



@Stateless(mappedName = "ejb/ClassePedido")
public class ClassePedido implements InterfacePedidosLocal{
    
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
    
}
