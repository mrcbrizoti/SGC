package br.com.caelum.tarefas.modelo;

/*
 * Vejamos como vai rolar
 */
public class Usuario {
	private Long id;
	public Long getId() {
		return id;
	}

	private String login;
	private String senha;

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
