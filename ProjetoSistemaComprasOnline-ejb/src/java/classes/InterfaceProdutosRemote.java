/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;
import entidade.Produtos;
import entidade.Usuario;
import java.util.List;
import javax.ejb.Remote;
@Remote
public interface InterfaceProdutosRemote {
    public void incluir(Produtos produto);
    public void alterar(Produtos produto);
    public void excluir(Produtos produto);
    public Produtos consultar(Produtos produto);
}
