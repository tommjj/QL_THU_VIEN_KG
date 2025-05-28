using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(QL_THU_VIEN_KG.Startup))]
namespace QL_THU_VIEN_KG
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
