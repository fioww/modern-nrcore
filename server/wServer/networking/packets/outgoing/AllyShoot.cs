using common;

namespace wServer.networking.packets.outgoing
{
    public class AllyShoot : OutgoingMessage
    {
        public byte BulletId;
        public int OwnerId;
        public ushort ContainerType;
        public float Angle;
        public bool Bard;

        public override PacketId ID => PacketId.ALLYSHOOT;
        public override Packet CreateInstance() { return new AllyShoot(); }

        protected override void Write(NWriter wtr)
        {
            wtr.Write(BulletId);
            wtr.Write(OwnerId);
            wtr.Write(ContainerType);
            wtr.Write(Angle);
            wtr.Write(Bard);
        }
    }
}
