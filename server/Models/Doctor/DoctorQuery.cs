using GraphQL.Types;
using Server.EntityFramework;
namespace Server.Models.Doctor
{

    public class DoctorQuery : ObjectGraphType
    {
        public DoctorQuery()
        {
            Field<ListGraphType<DoctorType>>("doctor", resolve: context =>
            {
                var DataContext = context.RequestServices.GetRequiredService<DataContext>();
                return DataContext.Doctors.DefaultIfEmpty();

            }
            );
        }

    }

}
