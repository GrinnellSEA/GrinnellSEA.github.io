---
title: Change Passwords
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

<script src="/js/github.min.js" async defer></script>
<script src="/js/gitauth.js" async defer></script>
<script src="/js/changepassword.js" async defer></script>
<script src="/js/sjcl.js" async defer></script>
