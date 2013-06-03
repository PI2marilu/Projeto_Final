
package classes;

import entidade.Pedidos;
import entidade.Usuario;
import java.util.List;
import javax.ejb.Local;

@Local
public interface InterfacePedidosLocal {
    
      public void incluir(Pedidos pedido);
    public void alterar(Pedidos pedido);
    public void excluir(Pedidos pedido);
    public List<Pedidos> consultar(Usuario pessoa);
    
}
