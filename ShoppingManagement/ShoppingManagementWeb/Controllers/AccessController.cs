using Microsoft.AspNetCore.Mvc;
using ShoppingManagementWeb.Models;
using System.Net.Mail;
using System.Net;

namespace ShoppingManagementWeb.Controllers
{
    public class AccessController : Controller
    {
        protected User transferUser = new User();
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public IActionResult Login(User u)
        {
            ShoppingManagementContext con = new ShoppingManagementContext();
            string username = u.Username;
            string password = u.Password;
            var st = con.Users.FirstOrDefault(x => x.Username == username && x.Password == password);
            //1 - admin
            //2 - customer
            //3 - employee
            if (st != null && st.Status is true)
            {
                switch (st.Roles)
                {
                    case 1:
                        HttpContext.Session.SetString("username", st.FullName);
                        return View("adminPage");
                    case 2:
                        HttpContext.Session.SetString("username", st.FullName);
                        return RedirectToAction("homePage", "Home");
                    case 3:
                        HttpContext.Session.SetString("username", st.FullName);
                        return View("employeePage");
                }
            }
            return View("homePage");
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("homePage", "Home");
        }
        [HttpPost]

        public IActionResult Register(User u)
        {
            string FullName = HttpContext.Request.Form["registerFullName"];
            string username = HttpContext.Request.Form["registerUsername"];
            string email = HttpContext.Request.Form["registerEmail"];
            string password = HttpContext.Request.Form["registerPassword"];
            string re_password = HttpContext.Request.Form["registerPasswordReInput"];
            string role = HttpContext.Request.Form["registerFullName"];
            ShoppingManagementContext con = new ShoppingManagementContext();
            var maxUser = con.Users.Max(x => x.UserId);
            var checkUsername = con.Users.FirstOrDefault(x => x.Username == username);
            var checkEmail = con.Users.FirstOrDefault(x => x.Email == email);
            if (checkUsername != null && checkEmail == null)
            {
                ViewBag.alert = "username error!";
                return View("Login", "Access");
            }
            else if (checkEmail != null && checkUsername == null)
            {
                ViewBag.alertEmail = "email error!";
                return View("Login", "Access");
            }
            else if (checkUsername != null && checkEmail != null)
            {
                ViewBag.userAndEmail = "Username, email error!";
                return View("Login", "Access");
            }
            else
            {
                try
                {
                    transferUser.UserId = maxUser + 1;
                    transferUser.Username = username;
                    transferUser.Email = email;
                    transferUser.Password = password;
                    transferUser.Roles = 2;
                    transferUser.FullName = FullName;
                    transferUser.Status = false;
                    con.Users.Add(transferUser);
                    con.SaveChanges();
                    string fromEmail = "motnamkhongtam431@gmail.com";
                    string toEmail = email;
                    string subject = "Xác nhận tài khoản";
                    int length = 5;
                    string OTP = GenerateRandomString(length);
                    string body = "Mã xác nhận là: " + OTP;

                    MailMessage mail = new MailMessage(fromEmail, toEmail, subject, body);

                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                    smtpClient.EnableSsl = true;
                    smtpClient.UseDefaultCredentials = false;
                    smtpClient.Credentials = new NetworkCredential(fromEmail, "efbvlmwzolrpzhoq");

                    smtpClient.Send(mail);
                    ViewBag.id = maxUser + 1;
                    ViewBag.data = OTP;
                    ViewBag.confirmation = "Email sent successfully.";
                    return View("ConfirmRegister");
                }
                catch (Exception ex)
                {
                    ViewBag.confirmation = "An error occurred while sending the email: " + ex.Message;
                    return View("Login", "Access");
                }
            }
        }
        public IActionResult ConfirmRegister()
        {
            return View();
        }
        [HttpPost]
        public IActionResult ConfirmRegister(User u)
        {
            string id = HttpContext.Request.Form["id"];
            string OTPBack = HttpContext.Request.Form["OTP"];
            string OTPCheck = HttpContext.Request.Form["passwordOTP"];
            string OTPCheckValid = HttpContext.Request.Form["passwordOTPReCheck"];
            if(OTPBack == OTPCheck && OTPCheck == OTPCheckValid)
            {
                Thread.Sleep(2000);
                ShoppingManagementContext con = new ShoppingManagementContext();
                var st = con.Users.FirstOrDefault(x => x.UserId.ToString().Equals(id));
                if(st != null)
                {
                    st.Status = true;
                    con.SaveChanges();
                    ViewBag.mess = "Bạn đã có thể đăng nhập !";
                    return View("Login");
                }
                else
                {
                    ViewBag.mess = "Có lỗi hệ thống vui lòng thử lại sau !";
                    return View("Login");
                }
                
                
            }
            return View("ConfirmRegister");
        }
        public string GenerateRandomString(int length)
        {
            const string chars = "0123456789";
            Random random = new Random();
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}
