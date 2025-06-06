using Microsoft.AspNet.Identity;
using Microsoft.Owin;
using Microsoft.Owin.Security.Cookies;
using Owin;
using System;
using System.Threading;

[assembly: OwinStartupAttribute(typeof(QL_THU_VIEN_KG.Startup))]
namespace QL_THU_VIEN_KG
{
    public partial class Startup {

        private static Timer _dailyTimer;
        public void Configuration(IAppBuilder app) {

            app.UseCookieAuthentication(new CookieAuthenticationOptions
            {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Accounts/Login"),
            });

            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            CreateDefaultAdminAcc.Create();

            // run daily tasks immediately on startup
            BackgroundServiceCallback(null);

            // Schedule daily tasks to run every midnight
            DateTime now = DateTime.Now;
            DateTime nextMidnight = now.Date.AddDays(1);
            TimeSpan initialDelay = nextMidnight - now;

            _dailyTimer = new Timer(BackgroundServiceCallback, null, initialDelay, TimeSpan.FromHours(24));
        }   

        private void BackgroundServiceCallback(object state)
        {
            DailyTaskService.RunDailyTasks();
        }
    }
}