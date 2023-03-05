package com.gerenciador.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Vizualizacao {
    @GetMapping("/cliente/vizualiza")
    public String excluiCliente(@RequestParam(defaultValue = "null") String nome) {
        return "cliente.html";
    }
}