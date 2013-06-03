
package classes;

import entidade.Produtos;
import java.util.List;
import javax.ejb.Local;

@Local
public interface InterfaceProdutosLocal {
    
    public void incluir(Produtos produto);
    public void alterar(Produtos produto);
    public void excluir(Produtos produto);
    public Produtos consultar(Produtos produto);
    public List<Produtos> consultarTodos();
    
    
}
