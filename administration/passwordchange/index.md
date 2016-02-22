---
title: Change Passwords
scripts:
  - gitauth
  - auth
  - changepassword
---

<form class="restricted r_admin">

<select>
	<option value="" disabled selected hidden>Select an account</option>
	<option value="guest">Guests</option>
	<option value="member">Members</option>
	<option value="admin">Administrators</option>
</select>
<br />
<input type="password" id="old" placeholder="Old Password" /> <br />
<input type="password" id="new1" placeholder="New Password" /> <br />
<input type="password" id="new2" placeholder="Confirm New Password" /> <br />

<span id="msg" style="color: red"></span><br />

<button id="submit">Change Password</button>

</form>
