package com.divisaozeroti.learning;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/produtos") // Define o prefixo base para todas as rotas desta classe
public class ProdutoController {

    private static final Logger logger = LoggerFactory.getLogger(ProdutoController.class);

    @GetMapping("/{id}")
    public String buscarPorId(@PathVariable Long id) {
        logger.info("Requisição recebida em buscarPorId - id: {}", id);
        return "Buscando produto com ID: " + id;
    }

    @GetMapping("")
    public String buscarPorNomeDeProduto(@RequestParam String nome) {
        logger.info("Requisição recebida em buscarPorNomeDeProduto - nome: {}", nome);
        return "Buscando usuário com o nome: " + nome;
    }
    
    //.../usuarios?nome=paulo
    @GetMapping("/usuarios")
    public String buscarPorNomeDeUsuario(@RequestParam String nome) {
        return "Buscando usuário com o nome: " + nome;
    }
    
    @PostMapping
    public String criar(@RequestBody String dadosProduto) {
        logger.info("Requisição recebida em criar - dados: {}", dadosProduto);
        return "Criando produto: " + dadosProduto;
    }

    @PutMapping("/{id}")
    public String atualizar(@PathVariable Long id, @RequestBody String dadosAtualizados) {
        return "Atualizando produto " + id + " com os dados: " + dadosAtualizados;
    }

    @DeleteMapping("/{id}")
    public String deletar(@PathVariable Long id) {
        return "Produto " + id + " deletado com sucesso.";
    }

    @DeleteMapping("/{mat}")
    public String deletar(@PathVariable Long mat) {
        //Linha de teste para exlusão.
        return "Cliente " + mat + " deletado com sucesso.";
    }

    
}
