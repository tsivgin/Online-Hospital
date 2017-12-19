<%@ Page Title="" Language="C#" MasterPageFile="~/main.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="Online_Hospital.services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    <script>
        $("span.menu-info").click(function () {
            $("ul.cl-effect-21").slideToggle("slow", function () {
            });
        });
    </script>
    <div class="clearfix"></div>


    <div class="portfolio_top">
        <div class="container">
            <h4>Services</h4>
            <ul id="filters">
                <li><span class="filter active" data-filter="app card icon web card2">ALL</span><label>/</label></li>
                <li><span class="filter" data-filter="app">Çocuk Hastalıkları</span><label>/</label></li>
                <li><span class="filter" data-filter="card2">Göz Hastalıkları</span><label>/</label></li>
                <li><span class="filter" data-filter="icon">Kulak Burun Boğaz</span><label>/</label></li>
                <li><span class="filter" data-filter="card">Beslenme ve Diyetik</span><label>/</label></li>
                <li><span class="filter" data-filter="app2">Ağız ve diş Hekimliği</span><label>/</label></li>
                <li><span class="filter" data-filter="icon2">Laboratuvar</span></li>
            </ul>
            <div id="portfoliolist">
                <div class="portfolio app mix_all" data-cat="app" style="display: inline-block; opacity: 1;">
                    <div class="portfolio-wrapper ">
                        <div class="view effect">
                            <a href="#" class="b-link-stripe b-animate-go  thickbox play-icon">
                                <img class="img-responsive" src="content/images/cocuk.jpg" alt="" /></a>
                            <div class="content-dot">
                                <a href="#" class="info" title="Full Image">Full Image</a>
                            </div>
                        </div>

                        <div class="simple">
                            <h5>Çocuk hastalıkları bölümümüzde; 0-18 yaş grubuna (yenidoğan bebeklerden 18 yaşını dolduran ergenlik çağı çocuklarına kadar) tıbbi sorunlarda, tüm hastalıkların tanı ve tedavisi konularında hizmet verilir. Sağlam ve hasta çocuklar kontrol ve muayene edilerek aşı için yönlendirilir. Çocuk sağlığı ve gelişimiyle ilgili konularda anne ve babalar bilgilendirilerek topluma sağlıklı nesiller kazandırılmaya çalışılır.</h5>
                            <p>Çocuklarınızı getirmeden önce onlarla konuşarak muayene olayını anlatmanız, muayeneyi kolaylaştırır. Aileleri tarafından korkutulan çocuklar ise çok problem çıkarmakta ve muayeneyi zorlaştırmaktadır. Bu açıdan aile içi eğitimin önemini vurguluyoruz. Çocuk klinigimizde: . Yeni doğan muayenesi ve takibi . Sağlam çocuk takibi (büyüme ve gelişme takibi büyüme ve gelişmenin degerlendirmesi.) . Hasta çocuk muayenesi (doktorunuzun gerek göreceği tahlil ve görüntüleme tektikleri SGK'lı hastalarda fark alınmadan yapılmaktadır.) . Aşılama kartları kontrolü: Çocuğun aşı kartı kontrol edilir, eksikler tespit edilir ve aşı için yönlendirlir.</p>
                        </div>
                    </div>
                </div>
                <div class="portfolio icon mix_all" data-cat="icon" style="display: inline-block; opacity: 1;">
                    <div class="portfolio-wrapper">
                        <div class="view effect">
                            <a href="#" class="b-link-stripe b-animate-go  thickbox play-icon ">
                                <img class="img-responsive" src="content/images/kulak.jpg" alt="" /></a>
                            <div class="content-dot">
                                <a href="#" class="info" title="Full Image">Full Image</a>
                            </div>
                        </div>
                        <div class="simple">
                            <h5>Kulak Burun Boğaz bölümünde güncel tanı ve medikal tedavi yöntemleri uygulanmaktadır.Poliklinik muayenelerinde geleneksel yöntemlerin yanı sıra gerek duyulan hastalarda endoskopik muayene yöntemlerinden yararlanılmaktadır.</h5>
                            <p>Bölümümüzde medikal tedavisi gerçekleştirilen hastalıklar şu şekilde sıralanabilir. . Orta kulak ve diğer kulak enfeksiyonları, kulak kiri, işitme kayıpları. . Burun tıkanması ve kanamasına neden olan hastalıklar. . Alerjik nezle. . Sinüzitler ve diğer sinüs hastalıkları. . Bademcik, geniz eti ve boğaz hastalıkları. . Ses bozuklukları</p>
                        </div>
                    </div>
                </div>
                <div class="portfolio card mix_all" data-cat="card" style="display: inline-block; opacity: 1;">
                    <div class="portfolio-wrapper">
                        <div class="view effect">
                            <a href="#" class="b-link-stripe b-animate-go  thickbox play-icon ">
                                <img class="img-responsive" src="content/images/beslenme.jpg" alt="" /></a>
                            <div class="content-dot">
                                <a href="#" class="info" title="Full Image">Full Image</a>
                            </div>
                        </div>
                        <div class="simple">
                            <h5>Beslenme ve Diyetetik</h5>
                            <p>Beslenme; büyüme, yaşamın sürdürülmesi ve sağlığın korunması için besinlerin kullanılmasıdır. Koruyucu ve iyileştirici sağlık hizmetlerinin önemli öğelerinden biri de sağlıklı beslenmektir. Danışanların, kendi yaşam şekline uygun diyetin nasıl olması gerektiğini, hastalıkların oluşmasında beslenme ile ilgili etmenlerin neler olduğunu, hastalık anında diyetinde yapması gerekli değişiklikler ile besinlerin hazırlanması ve pişirilmesinde uyulacak kuralları bilmesi ve doğru uygulamalar yapabilmesinin bilimsel yollarını öğreterek danışanlarının yaşam kalitesini artırmaya destek olmaktadır. Beslenme danışmanlığı almak isteyenlerin veya hastaların önce vücut yağ, kas, su oranı ve mevcut yağın vücuttaki dağılımı tespit edilir, daha sonra, yaş, boy, cinsiyet, fiziksel aktivite ve kan bulguları doğrultusunda 'kişiye özel bir beslenme tedavisi' planlanır ve düzenli olarak takibi yapılır. Ayrıca; diyabet, gebe -emzirme dönemi, çocuk ve adolesan çağı gibi özel durumu bulunan kişilere de beslenme programları düzenlenir, eğitimleri verilir ve takibi yapılır.</p>
                        </div>
                    </div>
                </div>
                <div class="portfolio app2 mix_all" data-cat="app2" style="display: inline-block; opacity: 1;">
                    <div class="portfolio-wrapper ">
                        <div class="view effect">
                            <a href="#" class="b-link-stripe b-animate-go  thickbox play-icon ">
                                <img class="img-responsive" src="content/images/agiz.jpg" alt="" /></a>
                            <div class="content-dot">
                                <a href="#" class="info" title="Full Image">Full Image</a>
                            </div>
                        </div>
                        <div class="simple">
                            <h5>Sizin ve ailenizin daha sağlıklı gülümseyebilmesi için biz Türkan Saylan Tıp Merkezi diş hekimleri sizlerin yanındayız.</h5>
                            <p>Kliniğimizde, aşağıdaki temel diş hekimliği hizmetleri verilmektedir; . Koruyucu tedaviler ve ağız sağlığı bakım eğitimleri, . Diş çekimleri, . Konservatif tedaviler ( tüm diş çürüklerinin amalgam ve ışınlı kompozit dolgular ile tamamlanması), . Protetik tedaviler (ağızda oluşmuş tüm diş eksikliklerinin kuron köprü, iskelet protez veya total protezler ile tamamlanması)</p>
                        </div>
                    </div>
                </div>
                <div class="portfolio card2 mix_all" data-cat="card2" style="display: inline-block; opacity: 1;">
                    <div class="portfolio-wrapper ">
                        <div class="view effect">
                            <a href="#" class="b-link-stripe b-animate-go  thickbox play-icon ">
                                <img class="img-responsive" src="content/images/göz.jpg" alt="" /></a>
                            <div class="content-dot">
                                <a href="#" class="info" title="Full Image">Full Image</a>
                            </div>
                        </div>
                        <div class="simple">
                            <h5>Göz Hastalıkları polikliniğimizde; teknolojik cihazların desteğinde</h5>
                            <p>. Bilgisayarlı göz muayenesi ile kırma kusurlarının (miyopi, hipermetropi, astigmatizma ve presbiyopi) tanı ve tedavisi . Kontakt lens muayenesi . Göz tansiyonu ölçümü . Göz tansiyonu (glokom) takibi . Kornea kalınlığı ölçümü (pakimetri) . Kuru göz tanı ve tedavisi . Schirmer testi . Gözyaşı kanal tıkanıklığı tanı ve takibi . Diyabetik retinopati ( diyabete bağlı göz hastalığı) takibi . Hipertansif retinopati (hipertansiyona bağlı göz hastalığı) takibi . Sistemik hastalıkların göz bulgularının tanı ve takibi . Şaşılık muayenesi ve takibi . Akut ve kronik infeksiyöz hastalıkların tanı ve tedavisi . Akut yaralanmaların medikal tedavisi ve gözden yabancı cisim çıkarılması işlemleri yapılmaktadır. . Ayrıca klinimizde sürücü belgesi için sağlık raporu ve ilaç raporu verilebilmektedir.</p>
                        </div>
                    </div>
                </div>
                <div class="portfolio icon2 mix_all" data-cat="icon2" style="display: inline-block; opacity: 1;">
                    <div class="portfolio-wrapper">
                        <div class="view effect">
                            <a href="#small-dialog5" class="b-link-stripe b-animate-go  thickbox play-icon ">
                                <img class="img-responsive" src="content/images/laboratuvar.jpg" alt="" />
                                <div class="content-dot">
                                    <a href="#" class="info" title="Full Image">Full Image</a>
                                </div>
                        </div>
                        </a>
						     <div class="simple">
                                 <h5>Poliklinik uzmanlarımızın tanılarını güçlendirmek ve hastalarımızın bilimsel olarak hastalık takiplerini yapabilmek için gerekli görülen tetkikler laboratuarımızda yapılmaktadır.</h5>
                                 <p>Aşağıdaki başlıklar içinde yer alan kan, idrar ve gaita analizleri en kısa süre içinde sonuçlandırılmaktadır. . Rutin Kimyasal Tetkikler . Serolojik Tetkikler . Hematolojik Tetkikler . Hormonal testler . İdrar ve dışkı tahlilleri</p>
                             </div>
                    </div>

                </div>
                <div class="clearfix"></div>
            </div>
            <!-- Script for gallery Here -->
            <script type="text/javascript" src="Content/js/jquery.mixitup.min.js"></script>
            <script type="text/javascript"></script>
            <script>
                $(function () {

                    var filterList = {

                        init: function () {

                            // MixItUp plugin
                            // http://mixitup.io
                            $('#portfoliolist').mixitup({
                                targetSelector: '.portfolio',
                                filterSelector: '.filter',
                                effects: ['fade'],
                                easing: 'snap',
                                // call the hover effect
                                onMixEnd: filterList.hoverEffect()
                            });

                        },

                        hoverEffect: function () {

                            // Simple parallax effect
                            $('#portfoliolist .portfolio').hover(
                                function () {
                                    $(this).find('.label').stop().animate({ bottom: 0 }, 200, 'easeOutQuad');
                                    $(this).find('img').stop().animate({ top: -30 }, 500, 'easeOutQuad');
                                },
                                function () {
                                    $(this).find('.label').stop().animate({ bottom: -40 }, 200, 'easeInQuad');
                                    $(this).find('img').stop().animate({ top: 0 }, 300, 'easeOutQuad');
                                }
                            );

                        }

                    };

                    // Run the show!
                    filterList.init();


                });
            </script>
            <!-- Gallery Script Ends -->

        </div>
    </div>

</asp:Content>

