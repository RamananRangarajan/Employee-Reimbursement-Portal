document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('login-form');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const loginBtn = document.getElementById('login-btn');
    const messageBanner = document.getElementById('message-banner');
  
    form.addEventListener('submit', async function(e) {
      e.preventDefault();
  
      // Get form values
      const email = emailInput.value.trim();
      const password = passwordInput.value;
  
      // Disable button during request
      loginBtn.disabled = true;
      loginBtn.textContent = 'Logging in...';
  
      try {
        // Make API request
        const response = await fetch('/api/v1/auth_management/admin/auth/login', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
          },
          body: JSON.stringify({
            email: email,
            password: password
          })
        });
  
        const data = await response.json();
  
        if (response.ok) {
          // Success
          showMessage('Login successful! Redirecting...', 'success');
          
          // Store token if provided
          console.log("Data:", data);
          if (data.token) {
            localStorage.setItem('access_token', data.token);
            console.log("Token stored:", data.token);
          }
  
          // Redirect after 1.5 seconds
          setTimeout(() => {
            console.log("Redirecting to:", data.redirect_url);
            window.location.href = data.redirect_url ;
          }, 1500);
        } else {
          // Error
          const errorMessage = data.message || 'Login failed. Please check your credentials.';
          showMessage(errorMessage, 'error');
          
          // Re-enable button
          loginBtn.disabled = false;
          loginBtn.textContent = 'Login';
        }
      } catch (error) {
        // Network or other error
        showMessage('An error occurred. Please try again later.', 'error');
        
        // Re-enable button
        loginBtn.disabled = false;
        loginBtn.textContent = 'Login';
      }
    });
  
    function showMessage(message, type) {
      messageBanner.textContent = message;
      messageBanner.className = 'message-banner show ' + type;
  
      // Auto-hide error messages after 5 seconds
      if (type === 'error') {
        setTimeout(() => {
          messageBanner.classList.remove('show');
        }, 5000);
      }
    }
  });