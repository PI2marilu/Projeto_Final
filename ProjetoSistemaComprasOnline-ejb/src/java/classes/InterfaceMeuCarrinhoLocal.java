
package classes;

import entidade.MeuCarrinho;
import entidade.Usuario;
import java.util.List;
import javax.ejb.Local;

@Local
public interface InterfaceMeuCarrinhoLocal {
    
    public void incluir(MeuCarrinho produto);
    public void alterar(MeuCarrinho produto);
    public void excluir(MeuCarrinho produto);
    public List<MeuCarrinho> consultar(Usuario pessoa);

}
