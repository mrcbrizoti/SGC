package br.com.caelum.tarefas.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.dao.TarefaDAO;
import br.com.caelum.tarefas.modelo.Tarefa;

@Controller
public class OlaMundoController {
	
	@RequestMapping("/olaMundoSpring")
	public String execute(){
		System.out.println("Executando a lógica com Spring MVC");
		return "ok";
	}

	@RequestMapping("novaTarefa")
	public String form(){
		return "tarefa/formulario";
	}
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa,BindingResult result){
		if(result.hasFieldErrors("descricao")){
			return "tarefa/formulario";
		}
		TarefaDAO dao = new TarefaDAO();
		dao.adiciona(tarefa);
		return "tarefa/adiciona";
	}
	
	@RequestMapping("listaTarefas")
	public String lista(Model model){
		TarefaDAO dao = new TarefaDAO();
		model.addAttribute("tarefas",dao.lista());
		
		return "tarefa/lista";
	}
	
	@RequestMapping("removeTarefa")
	public String removeTarefa(Tarefa tarefa){
		TarefaDAO dao = new TarefaDAO();
		dao.remove(tarefa);
		
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("mostraTarefa")
	public String mosta(Long id,Model model){
		TarefaDAO dao = new TarefaDAO();
		model.addAttribute("tarefa",dao.buscaPorId(id));
		
		return "tarefa/mostra";
	}
	
	@RequestMapping("alteraTarefa")
	public String alteraTarefa(Tarefa tarefa){
		TarefaDAO dao = new TarefaDAO();
		dao.altera(tarefa);
		
		return "redirect:listaTarefas";
	}
	
	@RequestMapping("finalizaTarefa")
	public String finaliza(Long id, Model model){
		TarefaDAO dao = new TarefaDAO();
		dao.finaliza(id);
		
		Tarefa t = dao.buscaPorId(id);
		
		model.addAttribute("tarefa", t);
		
		return "tarefa/finalizada";
	}
	
}
