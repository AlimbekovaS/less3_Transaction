using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ITCollage.Startup))]
namespace ITCollage
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
