using GraphQL.Types;

namespace Server.Models.Doctor;

public class DoctorSchema : Schema
{
    public DoctorSchema(IServiceProvider serviceProvider) : base(serviceProvider)
    {
        Query = serviceProvider.GetRequiredService<DoctorQuery>();
        Mutation = serviceProvider.GetRequiredService<DoctorMutation>();
    }

}