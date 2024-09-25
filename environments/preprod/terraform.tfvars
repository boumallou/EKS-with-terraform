environment = "preprod"
octnis_app_name = "octnis"
# baymax_app_name = "Baymax"
# octnis_instance_size ="t3a.medium"
# baymax_instance_size = "t2.micro"
# octnis_key_name = "junejie"
# baymax_key_name = "junejie"
octnis_certificat_arn = "arn:aws:acm:ap-southeast-1:346327735892:certificate/f5f8a87d-ff8a-435b-98e3-7c8fc8b0388b" // domain *.preprod.uws-tech.com
#Octnis_record_name = "octnis.preprod.uws-tech.com"
bucketnames = ["preprod-claims.april.asia", #Index 0
                "preprod-myhealth-hk.april.asia", #Index 1
                "preprod-mybusinesstravel.april-international.com", #Index 2
                "preprod-myhealth-sg.april.asia", #Index 3
                "preprod-myhealth-th.april.asia", #Index 4
                "preprod-myhealth-vn.april.asia", #Index 5
                "preprod-axa.uexglobal.com", #Index 6
                "preprod-backoffice.uexglobal.com", #Index 7
                "preprod-business.uexglobal.com", #Index 8
                "preprod-maintenance.uexglobal.com", #Index 9
                "preprod-maintenance.uws-tech.com", #Index 10
                "preprod-mhf.april-international.com", #Index 11
                "preprod-myhealthfrance.april-international.com", #Index12
                "preprod-myhealth-du.april-international.com", #Index13
                "preprod-myhealth-dubai.april-international.com", #Index14
                "preprod-myhealth-hk.april-international.com", #Index15
                "preprod-myhealth-hongkong.april-international.com", #Index16
                "preprod-masante.april-entreprise.com", #Index17
                "preprod-myhealth-sg.april-international.com", #Index18
                "preprod-myhealth-singapore.april-international.com", #Index19
                "preprod-myhealth-th.april-international.com", #Index20
                "preprod-myhealth-thailand.april-international.com", #Index21
                "preprod-myhealth-vn.april-international.com", #Index22
                "preprod-myhealth-vietnam.april-international.com", #Index23
                "preprod-axa-payment.uexglobal.com", #Index24
                "preprod-long-term.april-international.com", #Index25"
                "preprod-mhi.april-international.com", #Index26
                "preprod-myhealthinternational.april-international.com", #Index27
                "preprod-mtc.april-international.com", #Index28
                "preprod-mytempocover.april-international.com", #Index29
                "preprod-admin-nis.april.asia", #Index30
                "preprod-myapril-business.april-international.com", #Index31
                "preprod-myapril.april-international.com", #Index32
                "preprod-producer.april.asia", #Index33
                "preprod-producer.april-international.com", #Index34
                "preprod-provider.april.asia", #Index35
                "preprod-short-term.april-international.com", #Index36
                "preprod-redirection-legacy.uexglobal.com", #Index37
                "preprod-myhealth-sg.uexglobal.com", #Index38
                "preprod-docs.uexglobal.com", #Index39
                "preprod-euw3.docs.uexglobal.com", #Index40
                "preprod-uexglobal.com", #Index41
                "baymax-logs-preprod-asia", #Index42
                "baymax-logs-preprod-euw3", #Index43
                "preprod-baymax-deployment-asia.uexglobal.com", #Index44
                "preprod-baymax-deployment-eu.uexglobal.com", #Index45
                "preprod.asia.product-administration", #Index46
                "preprod.euw3.product-administration", #Index47
                "preprod-octnis-deployment-asia.uexglobal.com", #Index48
                "preprod-admin-vpc-utilities", #Index49
                "preprod-ssh-private-keys", #Index50
                "octnis-preprod", #Index51
                "preprod-axa-pay.uexglobal.com" #Index5
              ]

Octnis_eks_cluster_name = "octnis-cluster"
Octnis_eks_cluster_name-eu = "octnis-cluster-eu"
