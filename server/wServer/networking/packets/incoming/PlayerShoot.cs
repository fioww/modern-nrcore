using common;

namespace wServer.networking.packets.incoming
{
    public class PlayerShoot : IncomingMessage
    {
        public int Time;
        public byte BulletId;
        public ushort ContainerType;
        public Position StartingPos;
        public float Angle;
        public short SpeedMult;
        public short LifeMult;

        public override PacketId ID => PacketId.PLAYERSHOOT;
        public override Packet CreateInstance() { return new PlayerShoot(); }

        protected override void Read(NReader rdr)
        {
            Time = rdr.ReadInt32();
            BulletId = rdr.ReadByte();
            ContainerType = rdr.ReadUInt16();
            StartingPos = Position.Read(rdr);
            Angle = rdr.ReadSingle();
            SpeedMult = rdr.ReadInt16();
            LifeMult = rdr.ReadInt16();
        }
    }
}
