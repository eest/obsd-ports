$ORIGIN example.com.
$TTL 300
@ SOA ns1.example.com. hostmaster.example.com. (
                1369872000 ; Serial
                3H         ; Refresh after three hours
                1H         ; Retry after one hour
                1W         ; Expire after one week
                1D )       ; Minimum one day TTL

@               3600    IN      NS      ns1.example.com.
@               3600    IN      NS      ns2.example.com.

ns1             3600    IN      A       10.0.0.1
ns2             3600    IN      A       10.0.0.2
