using common;

namespace wServer.networking.packets.outgoing
{
    public class Text : OutgoingMessage
    {
        public string Name;
        public int ObjectId;
        public int NumStars;
        public byte BubbleTime;
        public string Recipient;
        public string Txt;
        public string CleanText;
        public int NameColor = 0x123456;
        public int TextColor = 0x123456;
        public int StarBG;

        public override PacketId ID => PacketId.TEXT;
        public override Packet CreateInstance() { return new Text(); }

        protected override void Write(NWriter wtr)
        {
            wtr.WriteUTF(Name);
            wtr.Write(ObjectId);
            wtr.Write(NumStars);
            wtr.Write(BubbleTime);
            wtr.WriteUTF(Recipient);
            wtr.WriteUTF(Txt);
            wtr.WriteUTF(CleanText);
            wtr.Write(NameColor);
            wtr.Write(TextColor);
            wtr.Write(StarBG);
        }
    }
}
