enum 50103 "Reservation Type"
{
    Extensible = true;
    value(0; Member) {Caption = 'Member';} // Any member (Corporate/Gold/Family) making a booking
    value(1; Comp) {Caption = 'Comp';} //Free round
    value(2; Public) {Caption = 'Public';}  // Non-member playing (pays extra 10%)
}