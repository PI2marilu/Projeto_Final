
package classes;

import conexao.ProdutosFacade;
import entidade.Produtos;
import java.util.List;
import javax.ejb.EJB;
import javax.ejb.Stateless;



@Stateless(mappedName = "ejb/ClasseProduto")
public class ClasseProduto implements InterfaceProdutosLocal{

    @EJB
    ProdutosFacade facade;
    
    @Override
    public void incluir(Produtos produto) {
       facade.create(produto);
    }

    @Override
    public void alterar(Produtos produto) {
         facade.edit(produto);
    }

    @Override
    public void excluir(Produtos produto) {
         facade.remove(produto);
    }

    @Override
    public Produtos consultar(Produtos produto) {
        return facade.consultarProduto(produto);
    }

    @Override
    public List<Produtos> consultarTodos() {
         return facade.consultarTodosProduto();
    }


    

   
    
}
