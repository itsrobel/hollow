using GraphQL;
using GraphQL.Types;
using Server.EntityFramework;

namespace Server.Models.Doctor
{
    public class DoctorMutation : ObjectGraphType
    {
        public DoctorMutation()
        {
            Field<DoctorType>(
                "createDoctor",
                arguments: new QueryArguments(
                    new QueryArgument<NonNullGraphType<StringGraphType>> { Name = "name" }
                ),
                resolve: context =>
                {
                    var name = context.GetArgument<string>("name");
                    var longitude = context.GetArgument<decimal>("Longitude");
                    var latitude = context.GetArgument<decimal>("Latitude");
                    var hours = context.GetArgument<string>("hours");
                    var id = Guid.NewGuid().ToString().Replace("-", string.Empty);
                    var DataContext = context.RequestServices.GetRequiredService<DataContext>();
                    Doctor doctor = new Doctor
                    {
                        Id = id,
                        Name = name,
                        Longitude = longitude,
                        Latitude = latitude,
                        OpenHours = hours

                    };
                    DataContext.Doctors.Add(doctor);
                    DataContext.SaveChanges();
                    return doctor;
                }
            );
        }
    }
}
