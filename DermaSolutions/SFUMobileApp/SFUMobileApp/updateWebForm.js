function updateWebForm(username,password)
{
	//here is where you will assign whatever html/javascript needed for your form.
    
    
    document.getElementById('user').value = username;
    document.getElementById('pwd').value = password;
    var x = document.getElementsByName('Submit');
    
    var i;
    for (i = 0; i < x.length; i++) {
        x[i].click();
    }


}