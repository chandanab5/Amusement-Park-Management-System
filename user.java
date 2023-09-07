public class user {
	
	private String uid, phnum;

	
	public user() {
		super();
	}

	public user(String uid, String phnum) {
		super();
		this.uid = uid;
		this.phnum = phnum;
	}

	public String getuid() {
		return uid;
	}

	public void setuid(String uid) {
		this.uid = uid;
	}

	public String getphnum() {
		return phnum;
	}

	public void setphnum(String phnum) {
		this.phnum = phnum;
	}
}