package domain.dto;

public class SessionDto {
	private int SessionId;
	private String usersname;
	private String role;
	@Override
	public String toString() {
		return "SessionDto [SessionId=" + SessionId + ", usersname=" + usersname + ", role=" + role + "]";
	}
	public SessionDto() {}
	public SessionDto(int sessionId, String usersname, String role) {
		super();
		SessionId = sessionId;
		usersname = usersname;
		this.role = role;
	}
	public int getSessionId() {
		return SessionId;
	}
	public void setSessionId(int sessionId) {
		SessionId = sessionId;
	}
	public String getusersname() {
		return usersname;
	}
	public void setusersname(String usersname) {
		usersname = usersname;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
	

}
