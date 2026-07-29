--
-- PostgreSQL database dump
--

\restrict j85ekBzQxo5byOAR5eLju3yP3ZxztX1yhKYvYydkaqsSt3wbxAZ0hZRaJzydpqp

-- Dumped from database version 17.10 (Ubuntu 17.10-0ubuntu0.25.10.1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-0ubuntu0.26.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.products_warranty DROP CONSTRAINT IF EXISTS products_warranty_product_id_51395474_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_stock DROP CONSTRAINT IF EXISTS products_stock_variant_id_dc51ed5d_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_stock DROP CONSTRAINT IF EXISTS products_stock_product_id_170f916b_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_reviewimage DROP CONSTRAINT IF EXISTS products_reviewimage_review_id_c90b3860_fk_products_review_id;
ALTER TABLE IF EXISTS ONLY public.products_review DROP CONSTRAINT IF EXISTS products_review_product_id_d933ffa7_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_review DROP CONSTRAINT IF EXISTS products_review_customer_id_54220657_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_products DROP CONSTRAINT IF EXISTS products_promotionbl_promotionblock_id_e5dfe04c_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_categories DROP CONSTRAINT IF EXISTS products_promotionbl_promotionblock_id_dadbd43e_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_products DROP CONSTRAINT IF EXISTS products_promotionbl_product_id_ea5f3c1a_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_categories DROP CONSTRAINT IF EXISTS products_promotionbl_category_id_80df819f_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productvideo DROP CONSTRAINT IF EXISTS products_productvide_product_id_872fe729_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productvariant DROP CONSTRAINT IF EXISTS products_productvari_product_id_d9c22902_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productimage DROP CONSTRAINT IF EXISTS products_productimag_variant_id_bf70ade8_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productimage DROP CONSTRAINT IF EXISTS products_productimag_product_id_e747596a_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS products_productattr_variant_id_e4b8d9e4_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS products_productattr_product_id_b9a86828_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS products_productattr_attribute_id_de00002b_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_product_feature_tags DROP CONSTRAINT IF EXISTS products_product_feature_tags_tag_id_fkey;
ALTER TABLE IF EXISTS ONLY public.products_product_feature_tags DROP CONSTRAINT IF EXISTS products_product_feature_tags_product_id_fkey;
ALTER TABLE IF EXISTS ONLY public.products_product_categories DROP CONSTRAINT IF EXISTS products_product_cat_product_id_50ef8156_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_product_categories DROP CONSTRAINT IF EXISTS products_product_cat_category_id_27982bed_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_product_brands DROP CONSTRAINT IF EXISTS products_product_brands_brand_id_283aac29_fk_products_brand_id;
ALTER TABLE IF EXISTS ONLY public.products_product_brands DROP CONSTRAINT IF EXISTS products_product_bra_product_id_e551c83f_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_pricehistory DROP CONSTRAINT IF EXISTS products_pricehistor_variant_id_7a8d8d2e_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_pricehistory DROP CONSTRAINT IF EXISTS products_pricehistor_product_id_1fc0e3fe_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_variant_id_0ab210d0_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_promo_campaign_id_22319ff1_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_product_id_c39a20cb_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_category_id_7f843ced_fk_products_category_id;
ALTER TABLE IF EXISTS ONLY public.products_certificate DROP CONSTRAINT IF EXISTS products_certificate_product_id_7564eb6b_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.products_category DROP CONSTRAINT IF EXISTS products_category_parent_id_3388f6c9_fk_products_category_id;
ALTER TABLE IF EXISTS ONLY public.products_category_brands DROP CONSTRAINT IF EXISTS products_category_brands_brand_id_fc34923b_fk_products_brand_id;
ALTER TABLE IF EXISTS ONLY public.products_category_brands DROP CONSTRAINT IF EXISTS products_category_br_category_id_f3697e5d_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_category_attributes DROP CONSTRAINT IF EXISTS products_category_at_category_id_bf20cdc7_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_category_attributes DROP CONSTRAINT IF EXISTS products_category_at_attribute_id_4cd0be2e_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_tags DROP CONSTRAINT IF EXISTS products_blogpost_tags_tag_id_195753d7_fk_products_tag_id;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_tags DROP CONSTRAINT IF EXISTS products_blogpost_ta_blogpost_id_413833f9_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_related_products DROP CONSTRAINT IF EXISTS products_blogpost_re_product_id_de7a3b9d_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_related_products DROP CONSTRAINT IF EXISTS products_blogpost_re_blogpost_id_8b6639e4_fk_products_;
ALTER TABLE IF EXISTS ONLY public.products_blogpost DROP CONSTRAINT IF EXISTS products_blogpost_author_id_567d983f_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.products_banner DROP CONSTRAINT IF EXISTS products_banner_category_id_6ffcde53_fk_products_category_id;
ALTER TABLE IF EXISTS ONLY public.notifications_notificationlog DROP CONSTRAINT IF EXISTS notifications_notifi_order_id_275e19e6_fk_customers;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.customers_wishlist DROP CONSTRAINT IF EXISTS customers_wishlist_product_id_6788646b_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.customers_wishlist DROP CONSTRAINT IF EXISTS customers_wishlist_customer_id_8554e4f5_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_viewedproduct DROP CONSTRAINT IF EXISTS customers_viewedprod_product_id_f902dc9b_fk_products_;
ALTER TABLE IF EXISTS ONLY public.customers_viewedproduct DROP CONSTRAINT IF EXISTS customers_viewedprod_customer_id_8fa665f2_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_payment DROP CONSTRAINT IF EXISTS customers_payment_order_id_7af7afda_fk_customers_order_id;
ALTER TABLE IF EXISTS ONLY public.customers_orderstatushistory DROP CONSTRAINT IF EXISTS customers_orderstatu_order_id_34a07fdc_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_orderstatushistory DROP CONSTRAINT IF EXISTS customers_orderstatu_changed_by_id_71ca4256_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_orderitem DROP CONSTRAINT IF EXISTS customers_orderitem_variant_id_d4b3378b_fk_products_;
ALTER TABLE IF EXISTS ONLY public.customers_orderitem DROP CONSTRAINT IF EXISTS customers_orderitem_product_id_9189abb4_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.customers_orderitem DROP CONSTRAINT IF EXISTS customers_orderitem_order_id_0c19357b_fk_customers_order_id;
ALTER TABLE IF EXISTS ONLY public.customers_order DROP CONSTRAINT IF EXISTS customers_order_customer_id_032dd871_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.customers_delivery DROP CONSTRAINT IF EXISTS customers_delivery_order_id_006f6c75_fk_customers_order_id;
ALTER TABLE IF EXISTS ONLY public.customers_delivery DROP CONSTRAINT IF EXISTS customers_delivery_address_id_f3e68cce_fk_customers_address_id;
ALTER TABLE IF EXISTS ONLY public.customers_customerloyalty DROP CONSTRAINT IF EXISTS customers_customerlo_level_id_fb5f45fb_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_customerloyalty DROP CONSTRAINT IF EXISTS customers_customerlo_customer_id_539068e4_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_customer_user_permissions DROP CONSTRAINT IF EXISTS customers_customer_u_permission_id_36492949_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.customers_customer_user_permissions DROP CONSTRAINT IF EXISTS customers_customer_u_customer_id_39cf3cb6_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_customer_groups DROP CONSTRAINT IF EXISTS customers_customer_groups_group_id_f079b2be_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.customers_customer_groups DROP CONSTRAINT IF EXISTS customers_customer_g_customer_id_39e075d7_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_couponusage DROP CONSTRAINT IF EXISTS customers_couponusage_order_id_aa07dd51_fk_customers_order_id;
ALTER TABLE IF EXISTS ONLY public.customers_couponusage DROP CONSTRAINT IF EXISTS customers_couponusage_coupon_id_3c40cde6_fk_customers_coupon_id;
ALTER TABLE IF EXISTS ONLY public.customers_couponusage DROP CONSTRAINT IF EXISTS customers_couponusag_customer_id_cf9982e0_fk_customers;
ALTER TABLE IF EXISTS ONLY public.customers_changelog DROP CONSTRAINT IF EXISTS customers_changelog_user_id_cc89dfbf_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.customers_cart DROP CONSTRAINT IF EXISTS customers_cart_variant_id_6b82f2f7_fk_products_;
ALTER TABLE IF EXISTS ONLY public.customers_cart DROP CONSTRAINT IF EXISTS customers_cart_product_id_f9590726_fk_products_product_id;
ALTER TABLE IF EXISTS ONLY public.customers_cart DROP CONSTRAINT IF EXISTS customers_cart_customer_id_97ed88ec_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.customers_address DROP CONSTRAINT IF EXISTS customers_address_customer_id_f042422e_fk_customers_customer_id;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX IF EXISTS public.unique_product_warehouse;
DROP INDEX IF EXISTS public.unique_product_attribute;
DROP INDEX IF EXISTS public.unique_customer_cart_item;
DROP INDEX IF EXISTS public.products_warranty_product_id_51395474;
DROP INDEX IF EXISTS public.products_tag_slug_5def095b_like;
DROP INDEX IF EXISTS public.products_tag_name_df2d816e_like;
DROP INDEX IF EXISTS public.products_supplier_slug_1073577c_like;
DROP INDEX IF EXISTS public.products_stock_variant_id_dc51ed5d;
DROP INDEX IF EXISTS public.products_stock_product_id_170f916b;
DROP INDEX IF EXISTS public.products_st_variant_10937e_idx;
DROP INDEX IF EXISTS public.products_st_product_282fcc_idx;
DROP INDEX IF EXISTS public.products_reviewimage_review_id_c90b3860;
DROP INDEX IF EXISTS public.products_review_product_id_d933ffa7;
DROP INDEX IF EXISTS public.products_review_customer_id_54220657;
DROP INDEX IF EXISTS public.products_promotionblock_slug_003da5f5_like;
DROP INDEX IF EXISTS public.products_promotionblock_products_promotionblock_id_e5dfe04c;
DROP INDEX IF EXISTS public.products_promotionblock_products_product_id_ea5f3c1a;
DROP INDEX IF EXISTS public.products_promotionblock_categories_promotionblock_id_dadbd43e;
DROP INDEX IF EXISTS public.products_promotionblock_categories_category_id_80df819f;
DROP INDEX IF EXISTS public.products_promocampaign_slug_68a6d529_like;
DROP INDEX IF EXISTS public.products_productvideo_product_id_872fe729;
DROP INDEX IF EXISTS public.products_productvariant_sku_1b692018_like;
DROP INDEX IF EXISTS public.products_productvariant_product_id_d9c22902;
DROP INDEX IF EXISTS public.products_productimage_variant_id_bf70ade8;
DROP INDEX IF EXISTS public.products_productimage_product_id_e747596a;
DROP INDEX IF EXISTS public.products_productattribute_variant_id_e4b8d9e4;
DROP INDEX IF EXISTS public.products_productattribute_product_id_b9a86828;
DROP INDEX IF EXISTS public.products_productattribute_attribute_id_de00002b;
DROP INDEX IF EXISTS public.products_product_slug_70d3148d_like;
DROP INDEX IF EXISTS public.products_product_feature_tags_tag_id;
DROP INDEX IF EXISTS public.products_product_feature_tags_product_id;
DROP INDEX IF EXISTS public.products_product_categories_product_id_50ef8156;
DROP INDEX IF EXISTS public.products_product_categories_category_id_27982bed;
DROP INDEX IF EXISTS public.products_product_brands_product_id_e551c83f;
DROP INDEX IF EXISTS public.products_product_brands_brand_id_283aac29;
DROP INDEX IF EXISTS public.products_pricehistory_variant_id_7a8d8d2e;
DROP INDEX IF EXISTS public.products_pricehistory_product_id_1fc0e3fe;
DROP INDEX IF EXISTS public.products_pr_variant_9e2fe6_idx;
DROP INDEX IF EXISTS public.products_pr_variant_989f38_idx;
DROP INDEX IF EXISTS public.products_pr_product_f0e7be_idx;
DROP INDEX IF EXISTS public.products_pr_product_94a04a_idx;
DROP INDEX IF EXISTS public.products_pr_product_66459e_idx;
DROP INDEX IF EXISTS public.products_pr_attribu_87c5a9_idx;
DROP INDEX IF EXISTS public.products_pr_attribu_4705f4_idx;
DROP INDEX IF EXISTS public.products_discount_variant_id_0ab210d0;
DROP INDEX IF EXISTS public.products_discount_promo_campaign_id_22319ff1;
DROP INDEX IF EXISTS public.products_discount_product_id_c39a20cb;
DROP INDEX IF EXISTS public.products_discount_category_id_7f843ced;
DROP INDEX IF EXISTS public.products_di_variant_7129c4_idx;
DROP INDEX IF EXISTS public.products_di_product_33ad43_idx;
DROP INDEX IF EXISTS public.products_di_categor_a1a6ee_idx;
DROP INDEX IF EXISTS public.products_certificate_product_id_7564eb6b;
DROP INDEX IF EXISTS public.products_category_slug_c558efae_like;
DROP INDEX IF EXISTS public.products_category_parent_id_3388f6c9;
DROP INDEX IF EXISTS public.products_category_brands_category_id_f3697e5d;
DROP INDEX IF EXISTS public.products_category_brands_brand_id_fc34923b;
DROP INDEX IF EXISTS public.products_category_attributes_category_id_bf20cdc7;
DROP INDEX IF EXISTS public.products_category_attributes_attribute_id_4cd0be2e;
DROP INDEX IF EXISTS public.products_blogpost_tags_tag_id_195753d7;
DROP INDEX IF EXISTS public.products_blogpost_tags_blogpost_id_413833f9;
DROP INDEX IF EXISTS public.products_blogpost_slug_59c8d621_like;
DROP INDEX IF EXISTS public.products_blogpost_related_products_product_id_de7a3b9d;
DROP INDEX IF EXISTS public.products_blogpost_related_products_blogpost_id_8b6639e4;
DROP INDEX IF EXISTS public.products_blogpost_author_id_567d983f;
DROP INDEX IF EXISTS public.products_bl_status_aab172_idx;
DROP INDEX IF EXISTS public.products_banner_category_id_6ffcde53;
DROP INDEX IF EXISTS public.products_attribute_slug_3436e67a_like;
DROP INDEX IF EXISTS public.products_attribute_name_e203e819_like;
DROP INDEX IF EXISTS public.products_at_type_f4fcf3_idx;
DROP INDEX IF EXISTS public.products_adminsection_key_7d3f08c7_like;
DROP INDEX IF EXISTS public.notifications_notificationsettings_name_de22d795_like;
DROP INDEX IF EXISTS public.notifications_notificationlog_order_id_275e19e6;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.customers_wishlist_product_id_6788646b;
DROP INDEX IF EXISTS public.customers_wishlist_customer_id_8554e4f5;
DROP INDEX IF EXISTS public.customers_viewedproduct_product_id_f902dc9b;
DROP INDEX IF EXISTS public.customers_viewedproduct_customer_id_8fa665f2;
DROP INDEX IF EXISTS public.customers_payment_order_id_7af7afda;
DROP INDEX IF EXISTS public.customers_orderstatushistory_order_id_34a07fdc;
DROP INDEX IF EXISTS public.customers_orderstatushistory_changed_by_id_71ca4256;
DROP INDEX IF EXISTS public.customers_orderitem_variant_id_d4b3378b;
DROP INDEX IF EXISTS public.customers_orderitem_product_id_9189abb4;
DROP INDEX IF EXISTS public.customers_orderitem_order_id_0c19357b;
DROP INDEX IF EXISTS public.customers_order_order_number_b3d7f651_like;
DROP INDEX IF EXISTS public.customers_order_customer_id_032dd871;
DROP INDEX IF EXISTS public.customers_loyaltyprogram_slug_dc3ba2d5_like;
DROP INDEX IF EXISTS public.customers_delivery_address_id_f3e68cce;
DROP INDEX IF EXISTS public.customers_customerloyalty_level_id_fb5f45fb;
DROP INDEX IF EXISTS public.customers_customer_user_permissions_permission_id_36492949;
DROP INDEX IF EXISTS public.customers_customer_user_permissions_customer_id_39cf3cb6;
DROP INDEX IF EXISTS public.customers_customer_groups_group_id_f079b2be;
DROP INDEX IF EXISTS public.customers_customer_groups_customer_id_39e075d7;
DROP INDEX IF EXISTS public.customers_customer_email_300e404b_like;
DROP INDEX IF EXISTS public.customers_couponusage_order_id_aa07dd51;
DROP INDEX IF EXISTS public.customers_couponusage_customer_id_cf9982e0;
DROP INDEX IF EXISTS public.customers_couponusage_coupon_id_3c40cde6;
DROP INDEX IF EXISTS public.customers_coupon_code_6015aa33_like;
DROP INDEX IF EXISTS public.customers_changelog_user_id_cc89dfbf;
DROP INDEX IF EXISTS public.customers_cart_variant_id_6b82f2f7;
DROP INDEX IF EXISTS public.customers_cart_session_key_fe9c4fe9_like;
DROP INDEX IF EXISTS public.customers_cart_session_key_fe9c4fe9;
DROP INDEX IF EXISTS public.customers_cart_product_id_f9590726;
DROP INDEX IF EXISTS public.customers_cart_customer_id_97ed88ec;
DROP INDEX IF EXISTS public.customers_c_model_n_b180dc_idx;
DROP INDEX IF EXISTS public.customers_c_created_3f28da_idx;
DROP INDEX IF EXISTS public.customers_address_customer_id_f042422e;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
ALTER TABLE IF EXISTS ONLY public.products_stock DROP CONSTRAINT IF EXISTS unique_variant_warehouse;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS unique_variant_attribute;
ALTER TABLE IF EXISTS ONLY public.services_serviceitem DROP CONSTRAINT IF EXISTS services_serviceitem_pkey;
ALTER TABLE IF EXISTS ONLY public.products_warranty DROP CONSTRAINT IF EXISTS products_warranty_pkey;
ALTER TABLE IF EXISTS ONLY public.products_tag DROP CONSTRAINT IF EXISTS products_tag_slug_key1;
ALTER TABLE IF EXISTS ONLY public.products_brand DROP CONSTRAINT IF EXISTS products_tag_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_tag DROP CONSTRAINT IF EXISTS products_tag_pkey1;
ALTER TABLE IF EXISTS ONLY public.products_brand DROP CONSTRAINT IF EXISTS products_tag_pkey;
ALTER TABLE IF EXISTS ONLY public.products_tag DROP CONSTRAINT IF EXISTS products_tag_name_key1;
ALTER TABLE IF EXISTS ONLY public.products_brand DROP CONSTRAINT IF EXISTS products_tag_name_key;
ALTER TABLE IF EXISTS ONLY public.products_supplier DROP CONSTRAINT IF EXISTS products_supplier_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_supplier DROP CONSTRAINT IF EXISTS products_supplier_pkey;
ALTER TABLE IF EXISTS ONLY public.products_stock DROP CONSTRAINT IF EXISTS products_stock_pkey;
ALTER TABLE IF EXISTS ONLY public.products_reviewimage DROP CONSTRAINT IF EXISTS products_reviewimage_pkey;
ALTER TABLE IF EXISTS ONLY public.products_review DROP CONSTRAINT IF EXISTS products_review_product_id_customer_id_aea431ea_uniq;
ALTER TABLE IF EXISTS ONLY public.products_review DROP CONSTRAINT IF EXISTS products_review_pkey;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock DROP CONSTRAINT IF EXISTS products_promotionblock_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_products DROP CONSTRAINT IF EXISTS products_promotionblock_products_pkey;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock DROP CONSTRAINT IF EXISTS products_promotionblock_pkey;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_categories DROP CONSTRAINT IF EXISTS products_promotionblock_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_products DROP CONSTRAINT IF EXISTS products_promotionblock__promotionblock_id_produc_0dc90576_uniq;
ALTER TABLE IF EXISTS ONLY public.products_promotionblock_categories DROP CONSTRAINT IF EXISTS products_promotionblock__promotionblock_id_catego_ece4c1df_uniq;
ALTER TABLE IF EXISTS ONLY public.products_promocampaign DROP CONSTRAINT IF EXISTS products_promocampaign_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_promocampaign DROP CONSTRAINT IF EXISTS products_promocampaign_pkey;
ALTER TABLE IF EXISTS ONLY public.products_productvideo DROP CONSTRAINT IF EXISTS products_productvideo_pkey;
ALTER TABLE IF EXISTS ONLY public.products_productvariant DROP CONSTRAINT IF EXISTS products_productvariant_sku_key;
ALTER TABLE IF EXISTS ONLY public.products_productvariant DROP CONSTRAINT IF EXISTS products_productvariant_pkey;
ALTER TABLE IF EXISTS ONLY public.products_productimage DROP CONSTRAINT IF EXISTS products_productimage_pkey;
ALTER TABLE IF EXISTS ONLY public.products_productattribute DROP CONSTRAINT IF EXISTS products_productattribute_pkey;
ALTER TABLE IF EXISTS ONLY public.products_product DROP CONSTRAINT IF EXISTS products_product_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_product DROP CONSTRAINT IF EXISTS products_product_pkey;
ALTER TABLE IF EXISTS ONLY public.products_product_feature_tags DROP CONSTRAINT IF EXISTS products_product_feature_tags_product_id_tag_id_key;
ALTER TABLE IF EXISTS ONLY public.products_product_feature_tags DROP CONSTRAINT IF EXISTS products_product_feature_tags_pkey;
ALTER TABLE IF EXISTS ONLY public.products_product_categories DROP CONSTRAINT IF EXISTS products_product_categories_pkey;
ALTER TABLE IF EXISTS ONLY public.products_product_categories DROP CONSTRAINT IF EXISTS products_product_categor_product_id_category_id_a1f87bda_uniq;
ALTER TABLE IF EXISTS ONLY public.products_product_brands DROP CONSTRAINT IF EXISTS products_product_brands_product_id_brand_id_3fa625df_uniq;
ALTER TABLE IF EXISTS ONLY public.products_product_brands DROP CONSTRAINT IF EXISTS products_product_brands_pkey;
ALTER TABLE IF EXISTS ONLY public.products_pricehistory DROP CONSTRAINT IF EXISTS products_pricehistory_pkey;
ALTER TABLE IF EXISTS ONLY public.products_discount DROP CONSTRAINT IF EXISTS products_discount_pkey;
ALTER TABLE IF EXISTS ONLY public.products_certificate DROP CONSTRAINT IF EXISTS products_certificate_pkey;
ALTER TABLE IF EXISTS ONLY public.products_category DROP CONSTRAINT IF EXISTS products_category_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_category DROP CONSTRAINT IF EXISTS products_category_pkey;
ALTER TABLE IF EXISTS ONLY public.products_category_brands DROP CONSTRAINT IF EXISTS products_category_brands_pkey;
ALTER TABLE IF EXISTS ONLY public.products_category_brands DROP CONSTRAINT IF EXISTS products_category_brands_category_id_brand_id_cb11283c_uniq;
ALTER TABLE IF EXISTS ONLY public.products_category_attributes DROP CONSTRAINT IF EXISTS products_category_attributes_pkey;
ALTER TABLE IF EXISTS ONLY public.products_category_attributes DROP CONSTRAINT IF EXISTS products_category_attrib_category_id_attribute_id_be9aa488_uniq;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_tags DROP CONSTRAINT IF EXISTS products_blogpost_tags_pkey;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_tags DROP CONSTRAINT IF EXISTS products_blogpost_tags_blogpost_id_tag_id_16be3b26_uniq;
ALTER TABLE IF EXISTS ONLY public.products_blogpost DROP CONSTRAINT IF EXISTS products_blogpost_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_related_products DROP CONSTRAINT IF EXISTS products_blogpost_related_products_pkey;
ALTER TABLE IF EXISTS ONLY public.products_blogpost_related_products DROP CONSTRAINT IF EXISTS products_blogpost_relate_blogpost_id_product_id_db18a161_uniq;
ALTER TABLE IF EXISTS ONLY public.products_blogpost DROP CONSTRAINT IF EXISTS products_blogpost_pkey;
ALTER TABLE IF EXISTS ONLY public.products_banner DROP CONSTRAINT IF EXISTS products_banner_pkey;
ALTER TABLE IF EXISTS ONLY public.products_attribute DROP CONSTRAINT IF EXISTS products_attribute_slug_key;
ALTER TABLE IF EXISTS ONLY public.products_attribute DROP CONSTRAINT IF EXISTS products_attribute_pkey;
ALTER TABLE IF EXISTS ONLY public.products_attribute DROP CONSTRAINT IF EXISTS products_attribute_name_key;
ALTER TABLE IF EXISTS ONLY public.products_adminsection DROP CONSTRAINT IF EXISTS products_adminsection_pkey;
ALTER TABLE IF EXISTS ONLY public.products_adminsection DROP CONSTRAINT IF EXISTS products_adminsection_key_key;
ALTER TABLE IF EXISTS ONLY public.notifications_notificationsettings DROP CONSTRAINT IF EXISTS notifications_notificationsettings_pkey;
ALTER TABLE IF EXISTS ONLY public.notifications_notificationsettings DROP CONSTRAINT IF EXISTS notifications_notificationsettings_name_key;
ALTER TABLE IF EXISTS ONLY public.notifications_notificationlog DROP CONSTRAINT IF EXISTS notifications_notificationlog_pkey;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_wishlist DROP CONSTRAINT IF EXISTS customers_wishlist_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_wishlist DROP CONSTRAINT IF EXISTS customers_wishlist_customer_id_product_id_c7c0b3de_uniq;
ALTER TABLE IF EXISTS ONLY public.customers_viewedproduct DROP CONSTRAINT IF EXISTS customers_viewedproduct_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_viewedproduct DROP CONSTRAINT IF EXISTS customers_viewedproduct_customer_id_product_id_01ba8d44_uniq;
ALTER TABLE IF EXISTS ONLY public.customers_payment DROP CONSTRAINT IF EXISTS customers_payment_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_orderstatushistory DROP CONSTRAINT IF EXISTS customers_orderstatushistory_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_orderitem DROP CONSTRAINT IF EXISTS customers_orderitem_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_order DROP CONSTRAINT IF EXISTS customers_order_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_order DROP CONSTRAINT IF EXISTS customers_order_order_number_key;
ALTER TABLE IF EXISTS ONLY public.customers_loyaltyprogram DROP CONSTRAINT IF EXISTS customers_loyaltyprogram_slug_key;
ALTER TABLE IF EXISTS ONLY public.customers_loyaltyprogram DROP CONSTRAINT IF EXISTS customers_loyaltyprogram_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_delivery DROP CONSTRAINT IF EXISTS customers_delivery_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_delivery DROP CONSTRAINT IF EXISTS customers_delivery_order_id_key;
ALTER TABLE IF EXISTS ONLY public.customers_customerloyalty DROP CONSTRAINT IF EXISTS customers_customerloyalty_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_customerloyalty DROP CONSTRAINT IF EXISTS customers_customerloyalty_customer_id_key;
ALTER TABLE IF EXISTS ONLY public.customers_customer_user_permissions DROP CONSTRAINT IF EXISTS customers_customer_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_customer_user_permissions DROP CONSTRAINT IF EXISTS customers_customer_user__customer_id_permission_i_cd47699c_uniq;
ALTER TABLE IF EXISTS ONLY public.customers_customer DROP CONSTRAINT IF EXISTS customers_customer_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_customer_groups DROP CONSTRAINT IF EXISTS customers_customer_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_customer_groups DROP CONSTRAINT IF EXISTS customers_customer_groups_customer_id_group_id_83eb0e0e_uniq;
ALTER TABLE IF EXISTS ONLY public.customers_customer DROP CONSTRAINT IF EXISTS customers_customer_email_key;
ALTER TABLE IF EXISTS ONLY public.customers_couponusage DROP CONSTRAINT IF EXISTS customers_couponusage_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_coupon DROP CONSTRAINT IF EXISTS customers_coupon_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_coupon DROP CONSTRAINT IF EXISTS customers_coupon_code_key;
ALTER TABLE IF EXISTS ONLY public.customers_changelog DROP CONSTRAINT IF EXISTS customers_changelog_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_cart DROP CONSTRAINT IF EXISTS customers_cart_pkey;
ALTER TABLE IF EXISTS ONLY public.customers_address DROP CONSTRAINT IF EXISTS customers_address_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
DROP TABLE IF EXISTS public.services_serviceitem;
DROP TABLE IF EXISTS public.products_warranty;
DROP TABLE IF EXISTS public.products_tag;
DROP TABLE IF EXISTS public.products_supplier;
DROP TABLE IF EXISTS public.products_stock;
DROP TABLE IF EXISTS public.products_reviewimage;
DROP TABLE IF EXISTS public.products_review;
DROP TABLE IF EXISTS public.products_promotionblock_products;
DROP TABLE IF EXISTS public.products_promotionblock_categories;
DROP TABLE IF EXISTS public.products_promotionblock;
DROP TABLE IF EXISTS public.products_promocampaign;
DROP TABLE IF EXISTS public.products_productvideo;
DROP TABLE IF EXISTS public.products_productvariant;
DROP TABLE IF EXISTS public.products_productimage;
DROP TABLE IF EXISTS public.products_productattribute;
DROP TABLE IF EXISTS public.products_product_feature_tags;
DROP TABLE IF EXISTS public.products_product_categories;
DROP TABLE IF EXISTS public.products_product_brands;
DROP TABLE IF EXISTS public.products_product;
DROP TABLE IF EXISTS public.products_pricehistory;
DROP TABLE IF EXISTS public.products_discount;
DROP TABLE IF EXISTS public.products_certificate;
DROP TABLE IF EXISTS public.products_category_brands;
DROP TABLE IF EXISTS public.products_category_attributes;
DROP TABLE IF EXISTS public.products_category;
DROP TABLE IF EXISTS public.products_brand;
DROP TABLE IF EXISTS public.products_blogpost_tags;
DROP TABLE IF EXISTS public.products_blogpost_related_products;
DROP TABLE IF EXISTS public.products_blogpost;
DROP TABLE IF EXISTS public.products_banner;
DROP TABLE IF EXISTS public.products_attribute;
DROP TABLE IF EXISTS public.products_adminsection;
DROP TABLE IF EXISTS public.notifications_notificationsettings;
DROP TABLE IF EXISTS public.notifications_notificationlog;
DROP TABLE IF EXISTS public.django_session;
DROP TABLE IF EXISTS public.django_migrations;
DROP TABLE IF EXISTS public.django_content_type;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.customers_wishlist;
DROP TABLE IF EXISTS public.customers_viewedproduct;
DROP TABLE IF EXISTS public.customers_payment;
DROP TABLE IF EXISTS public.customers_orderstatushistory;
DROP TABLE IF EXISTS public.customers_orderitem;
DROP TABLE IF EXISTS public.customers_order;
DROP TABLE IF EXISTS public.customers_loyaltyprogram;
DROP TABLE IF EXISTS public.customers_delivery;
DROP TABLE IF EXISTS public.customers_customerloyalty;
DROP TABLE IF EXISTS public.customers_customer_user_permissions;
DROP TABLE IF EXISTS public.customers_customer_groups;
DROP TABLE IF EXISTS public.customers_customer;
DROP TABLE IF EXISTS public.customers_couponusage;
DROP TABLE IF EXISTS public.customers_coupon;
DROP TABLE IF EXISTS public.customers_changelog;
DROP TABLE IF EXISTS public.customers_cart;
DROP TABLE IF EXISTS public.customers_address;
DROP TABLE IF EXISTS public.auth_permission;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP TABLE IF EXISTS public.auth_group;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- *not* creating schema, since initdb creates it


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_address (
    id bigint NOT NULL,
    title character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    phone character varying(20) NOT NULL,
    country character varying(100) NOT NULL,
    city character varying(100) NOT NULL,
    street character varying(255) NOT NULL,
    house character varying(50) NOT NULL,
    apartment character varying(50) NOT NULL,
    postal_code character varying(20) NOT NULL,
    is_default boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    customer_id bigint NOT NULL
);


--
-- Name: customers_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_address ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_cart; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_cart (
    id bigint NOT NULL,
    session_key character varying(100) NOT NULL,
    quantity integer NOT NULL,
    added_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    customer_id bigint,
    product_id bigint NOT NULL,
    variant_id bigint,
    CONSTRAINT customers_cart_quantity_check CHECK ((quantity >= 0))
);


--
-- Name: customers_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_cart ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_cart_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_changelog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_changelog (
    id bigint NOT NULL,
    action character varying(10) NOT NULL,
    model_name character varying(100) NOT NULL,
    object_id integer NOT NULL,
    object_repr character varying(255) NOT NULL,
    changes jsonb NOT NULL,
    ip_address inet,
    created_at timestamp with time zone NOT NULL,
    user_id bigint,
    CONSTRAINT customers_changelog_object_id_check CHECK ((object_id >= 0))
);


--
-- Name: customers_changelog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_changelog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_changelog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_coupon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_coupon (
    id bigint NOT NULL,
    code character varying(50) NOT NULL,
    discount_type character varying(10) NOT NULL,
    value numeric(10,2) NOT NULL,
    min_order_amount numeric(10,2) NOT NULL,
    max_uses integer NOT NULL,
    used_count integer NOT NULL,
    max_uses_per_user integer NOT NULL,
    is_active boolean NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    created_at timestamp with time zone NOT NULL,
    CONSTRAINT customers_coupon_max_uses_check CHECK ((max_uses >= 0)),
    CONSTRAINT customers_coupon_max_uses_per_user_check CHECK ((max_uses_per_user >= 0)),
    CONSTRAINT customers_coupon_used_count_check CHECK ((used_count >= 0))
);


--
-- Name: customers_coupon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_coupon ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_couponusage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_couponusage (
    id bigint NOT NULL,
    discount_amount numeric(10,2) NOT NULL,
    used_at timestamp with time zone NOT NULL,
    coupon_id bigint NOT NULL,
    customer_id bigint NOT NULL,
    order_id bigint
);


--
-- Name: customers_couponusage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_couponusage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_couponusage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_customer; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_customer (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    nickname character varying(100) NOT NULL
);


--
-- Name: customers_customer_groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_customer_groups (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: customers_customer_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_customer_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_customer_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_customer ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_customer_user_permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_customer_user_permissions (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: customers_customer_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_customer_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_customer_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_customerloyalty; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_customerloyalty (
    id bigint NOT NULL,
    total_orders integer NOT NULL,
    total_spent numeric(10,2) NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    customer_id bigint NOT NULL,
    level_id bigint,
    CONSTRAINT customers_customerloyalty_total_orders_check CHECK ((total_orders >= 0))
);


--
-- Name: customers_customerloyalty_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_customerloyalty ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_customerloyalty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_delivery; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_delivery (
    id bigint NOT NULL,
    address_snapshot text NOT NULL,
    tracking_number character varying(100) NOT NULL,
    courier character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    estimated_date date,
    delivered_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    address_id bigint,
    order_id bigint NOT NULL
);


--
-- Name: customers_delivery_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_delivery ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_loyaltyprogram; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_loyaltyprogram (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description text NOT NULL,
    min_orders integer NOT NULL,
    min_spent numeric(10,2) NOT NULL,
    discount_percent numeric(4,1) NOT NULL,
    free_shipping boolean NOT NULL,
    priority_support boolean NOT NULL,
    is_active boolean NOT NULL,
    sort_order integer NOT NULL,
    CONSTRAINT customers_loyaltyprogram_min_orders_check CHECK ((min_orders >= 0))
);


--
-- Name: customers_loyaltyprogram_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_loyaltyprogram ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_loyaltyprogram_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_order (
    id bigint NOT NULL,
    order_number character varying(50) NOT NULL,
    status character varying(20) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    phone1 character varying(20) NOT NULL,
    phone2 character varying(20) NOT NULL,
    address text NOT NULL,
    comments text NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    customer_id bigint
);


--
-- Name: customers_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_order ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_orderitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_orderitem (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL,
    variant_id bigint,
    CONSTRAINT customers_orderitem_quantity_check CHECK ((quantity >= 0))
);


--
-- Name: customers_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_orderitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_orderstatushistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_orderstatushistory (
    id bigint NOT NULL,
    old_status character varying(20) NOT NULL,
    new_status character varying(20) NOT NULL,
    comment text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    changed_by_id bigint,
    order_id bigint NOT NULL
);


--
-- Name: customers_orderstatushistory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_orderstatushistory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_orderstatushistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_payment (
    id bigint NOT NULL,
    method character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    amount numeric(10,2) NOT NULL,
    external_id character varying(255) NOT NULL,
    paid_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    order_id bigint NOT NULL
);


--
-- Name: customers_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_payment ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_viewedproduct; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_viewedproduct (
    id bigint NOT NULL,
    viewed_at timestamp with time zone NOT NULL,
    view_count integer NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT customers_viewedproduct_view_count_check CHECK ((view_count >= 0))
);


--
-- Name: customers_viewedproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_viewedproduct ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_viewedproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers_wishlist; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.customers_wishlist (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: customers_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.customers_wishlist ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.customers_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: notifications_notificationlog; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications_notificationlog (
    id bigint NOT NULL,
    notification_type character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    message text NOT NULL,
    recipient character varying(255) NOT NULL,
    error_message text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    sent_at timestamp with time zone,
    order_id bigint
);


--
-- Name: notifications_notificationlog_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.notifications_notificationlog ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.notifications_notificationlog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: notifications_notificationsettings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notifications_notificationsettings (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    telegram_enabled boolean NOT NULL,
    telegram_chat_id character varying(100) NOT NULL,
    email_enabled boolean NOT NULL,
    email_address character varying(254) NOT NULL,
    notify_new_orders boolean NOT NULL,
    notify_status_changes boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: notifications_notificationsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.notifications_notificationsettings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.notifications_notificationsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_adminsection; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_adminsection (
    id bigint NOT NULL,
    key character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    is_visible boolean NOT NULL,
    is_visible_by_default boolean NOT NULL,
    sort_order integer NOT NULL
);


--
-- Name: products_adminsection_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_adminsection ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_adminsection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_attribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_attribute (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    unit character varying(100) NOT NULL,
    enum_options jsonb,
    type character varying(10) NOT NULL
);


--
-- Name: products_attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_attribute ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_banner; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_banner (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    subtitle text NOT NULL,
    image character varying(100) NOT NULL,
    image_mobile character varying(100),
    link character varying(200) NOT NULL,
    placement character varying(20) NOT NULL,
    is_active boolean NOT NULL,
    sort_order integer NOT NULL,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    category_id bigint
);


--
-- Name: products_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_banner ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_blogpost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blogpost (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    excerpt text NOT NULL,
    content text NOT NULL,
    image character varying(100),
    status character varying(20) NOT NULL,
    meta_title character varying(255) NOT NULL,
    meta_description text NOT NULL,
    published_at timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    author_id bigint,
    noindex boolean NOT NULL
);


--
-- Name: products_blogpost_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_blogpost ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_blogpost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_blogpost_related_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blogpost_related_products (
    id bigint NOT NULL,
    blogpost_id bigint NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_blogpost_related_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_blogpost_related_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_blogpost_related_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_blogpost_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_blogpost_tags (
    id bigint NOT NULL,
    blogpost_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


--
-- Name: products_blogpost_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_blogpost_tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_blogpost_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_brand; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_brand (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    country character varying(100) NOT NULL,
    description text NOT NULL,
    logo character varying(100),
    website character varying(200) NOT NULL,
    logo_provenance character varying(30) NOT NULL,
    is_active boolean NOT NULL
);


--
-- Name: products_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_category (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    header_order integer NOT NULL,
    parent_id bigint,
    h1 character varying(255) NOT NULL,
    meta_description text NOT NULL,
    meta_title character varying(255) NOT NULL,
    image character varying(100),
    noindex boolean NOT NULL,
    page_description text NOT NULL
);


--
-- Name: products_category_attributes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_category_attributes (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    attribute_id bigint NOT NULL
);


--
-- Name: products_category_attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_category_attributes ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_category_attributes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_category_brands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_category_brands (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    brand_id bigint NOT NULL
);


--
-- Name: products_category_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_category_brands ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_category_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_certificate; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_certificate (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    file character varying(100) NOT NULL,
    sort_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_certificate_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_certificate ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_certificate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_discount; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_discount (
    id bigint NOT NULL,
    discount_type character varying(10) NOT NULL,
    value numeric(10,2) NOT NULL,
    is_active boolean NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    min_quantity integer NOT NULL,
    category_id bigint,
    product_id bigint,
    variant_id bigint,
    promo_campaign_id bigint,
    CONSTRAINT products_discount_min_quantity_check CHECK ((min_quantity >= 0))
);


--
-- Name: products_discount_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_discount ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_discount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_pricehistory; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_pricehistory (
    id bigint NOT NULL,
    old_price numeric(10,2) NOT NULL,
    new_price numeric(10,2) NOT NULL,
    changed_at timestamp with time zone NOT NULL,
    reason character varying(255) NOT NULL,
    product_id bigint,
    variant_id bigint
);


--
-- Name: products_pricehistory_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_pricehistory ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_pricehistory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_product (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    is_active boolean NOT NULL,
    is_new boolean NOT NULL,
    is_favorite boolean NOT NULL,
    slug character varying(255) NOT NULL,
    h1 character varying(255) NOT NULL,
    meta_description text NOT NULL,
    meta_title character varying(255) NOT NULL,
    noindex boolean NOT NULL
);


--
-- Name: products_product_brands; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_product_brands (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    brand_id bigint NOT NULL
);


--
-- Name: products_product_brands_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_product_brands ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_product_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_product_categories (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: products_product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_product_categories ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_product_feature_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_product_feature_tags (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


--
-- Name: products_product_feature_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_product_feature_tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_feature_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_productattribute; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productattribute (
    id bigint NOT NULL,
    attribute_id bigint NOT NULL,
    product_id bigint,
    value_bool boolean,
    value_enum character varying(255) NOT NULL,
    value_int integer,
    value_str character varying(1024) NOT NULL,
    variant_id bigint
);


--
-- Name: products_productattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_productattribute ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_productattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_productimage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productimage (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    is_main boolean NOT NULL,
    product_id bigint,
    alt_text character varying(255) NOT NULL,
    image_type character varying(20) NOT NULL,
    sort_order integer NOT NULL,
    variant_id bigint,
    provenance character varying(20) DEFAULT 'web'::character varying NOT NULL
);


--
-- Name: products_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_productimage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_productvariant; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productvariant (
    id bigint NOT NULL,
    sku character varying(100) NOT NULL,
    name character varying(255) NOT NULL,
    price_override numeric(10,2),
    is_active boolean NOT NULL,
    sort_order integer NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_productvariant_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_productvariant ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_productvariant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_productvideo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_productvideo (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    url character varying(200) NOT NULL,
    platform character varying(50) NOT NULL,
    thumbnail character varying(100),
    sort_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_productvideo_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_productvideo ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_productvideo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_promocampaign; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_promocampaign (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text NOT NULL,
    is_active boolean NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    banner_image character varying(100),
    priority integer NOT NULL
);


--
-- Name: products_promocampaign_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_promocampaign ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_promocampaign_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_promotionblock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_promotionblock (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text NOT NULL,
    is_active boolean NOT NULL,
    sort_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);


--
-- Name: products_promotionblock_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_promotionblock_categories (
    id bigint NOT NULL,
    promotionblock_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: products_promotionblock_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_promotionblock_categories ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_promotionblock_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_promotionblock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_promotionblock ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_promotionblock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_promotionblock_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_promotionblock_products (
    id bigint NOT NULL,
    promotionblock_id bigint NOT NULL,
    product_id bigint NOT NULL
);


--
-- Name: products_promotionblock_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_promotionblock_products ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_promotionblock_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_review; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_review (
    id bigint NOT NULL,
    rating integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    customer_id bigint NOT NULL,
    product_id bigint NOT NULL,
    text text NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    verified_purchase boolean NOT NULL
);


--
-- Name: products_review_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_review ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_reviewimage; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_reviewimage (
    id bigint NOT NULL,
    image character varying(100) NOT NULL,
    sort_order integer NOT NULL,
    review_id bigint NOT NULL
);


--
-- Name: products_reviewimage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_reviewimage ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_reviewimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_stock; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_stock (
    id bigint NOT NULL,
    warehouse character varying(100) NOT NULL,
    quantity integer NOT NULL,
    reserved integer NOT NULL,
    product_id bigint,
    variant_id bigint,
    CONSTRAINT products_stock_quantity_check CHECK ((quantity >= 0)),
    CONSTRAINT products_stock_reserved_check CHECK ((reserved >= 0))
);


--
-- Name: products_stock_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_stock ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_supplier; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_supplier (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    contact_person character varying(200) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(50) NOT NULL,
    website character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    notes text NOT NULL
);


--
-- Name: products_supplier_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_supplier ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_supplier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_tag; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_tag (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


--
-- Name: products_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_brand ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_tag_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_tag ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_tag_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: products_warranty; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products_warranty (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    duration_value integer NOT NULL,
    duration_unit character varying(10) NOT NULL,
    description text NOT NULL,
    document character varying(100),
    is_active boolean NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT products_warranty_duration_value_check CHECK ((duration_value >= 0))
);


--
-- Name: products_warranty_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.products_warranty ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.products_warranty_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: services_serviceitem; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services_serviceitem (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    category character varying(20) NOT NULL,
    is_active boolean NOT NULL,
    sort_order integer NOT NULL
);


--
-- Name: services_serviceitem_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.services_serviceitem ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.services_serviceitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	3	add_permission
6	Can change permission	3	change_permission
7	Can delete permission	3	delete_permission
8	Can view permission	3	view_permission
9	Can add group	2	add_group
10	Can change group	2	change_group
11	Can delete group	2	delete_group
12	Can view group	2	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_customer
22	Can change user	6	change_customer
23	Can delete user	6	delete_customer
24	Can view user	6	view_customer
25	Can add Заказ	7	add_order
26	Can change Заказ	7	change_order
27	Can delete Заказ	7	delete_order
28	Can view Заказ	7	view_order
29	Can add Товар в заказе	8	add_orderitem
30	Can change Товар в заказе	8	change_orderitem
31	Can delete Товар в заказе	8	delete_orderitem
32	Can view Товар в заказе	8	view_orderitem
33	Can add Атрибут	9	add_attribute
34	Can change Атрибут	9	change_attribute
35	Can delete Атрибут	9	delete_attribute
36	Can view Атрибут	9	view_attribute
37	Can add Бренд	15	add_tag
38	Can change Бренд	15	change_tag
39	Can delete Бренд	15	delete_tag
40	Can view Бренд	15	view_tag
41	Can add Категория	10	add_category
42	Can change Категория	10	change_category
43	Can delete Категория	10	delete_category
44	Can view Категория	10	view_category
45	Can add Товар	11	add_product
46	Can change Товар	11	change_product
47	Can delete Товар	11	delete_product
48	Can view Товар	11	view_product
49	Can add Изображение товара	13	add_productimage
50	Can change Изображение товара	13	change_productimage
51	Can delete Изображение товара	13	delete_productimage
52	Can view Изображение товара	13	view_productimage
53	Can add Атрибут товара	12	add_productattribute
54	Can change Атрибут товара	12	change_productattribute
55	Can delete Атрибут товара	12	delete_productattribute
56	Can view Атрибут товара	12	view_productattribute
57	Can add Отзыв	14	add_review
58	Can change Отзыв	14	change_review
59	Can delete Отзыв	14	delete_review
60	Can view Отзыв	14	view_review
61	Can add Настройки уведомлений	17	add_notificationsettings
62	Can change Настройки уведомлений	17	change_notificationsettings
63	Can delete Настройки уведомлений	17	delete_notificationsettings
64	Can view Настройки уведомлений	17	view_notificationsettings
65	Can add Лог уведомлений	16	add_notificationlog
66	Can change Лог уведомлений	16	change_notificationlog
67	Can delete Лог уведомлений	16	delete_notificationlog
68	Can view Лог уведомлений	16	view_notificationlog
69	Can add Бренд	15	add_brand
70	Can change Бренд	15	change_brand
71	Can delete Бренд	15	delete_brand
72	Can view Бренд	15	view_brand
73	Can add Тег	20	add_tag
74	Can change Тег	20	change_tag
75	Can delete Тег	20	delete_tag
76	Can view Тег	20	view_tag
77	Can add Вариант товара	18	add_productvariant
78	Can change Вариант товара	18	change_productvariant
79	Can delete Вариант товара	18	delete_productvariant
80	Can view Вариант товара	18	view_productvariant
81	Can add Складской остаток	19	add_stock
82	Can change Складской остаток	19	change_stock
83	Can delete Складской остаток	19	delete_stock
84	Can view Складской остаток	19	view_stock
85	Can add Адрес доставки	21	add_address
86	Can change Адрес доставки	21	change_address
87	Can delete Адрес доставки	21	delete_address
88	Can view Адрес доставки	21	view_address
89	Can add Доставка	22	add_delivery
90	Can change Доставка	22	change_delivery
91	Can delete Доставка	22	delete_delivery
92	Can view Доставка	22	view_delivery
93	Can add История статуса заказа	23	add_orderstatushistory
94	Can change История статуса заказа	23	change_orderstatushistory
95	Can delete История статуса заказа	23	delete_orderstatushistory
96	Can view История статуса заказа	23	view_orderstatushistory
97	Can add Платёж	24	add_payment
98	Can change Платёж	24	change_payment
99	Can delete Платёж	24	delete_payment
100	Can view Платёж	24	view_payment
101	Can add Акция	27	add_promocampaign
102	Can change Акция	27	change_promocampaign
103	Can delete Акция	27	delete_promocampaign
104	Can view Акция	27	view_promocampaign
105	Can add Фото отзыва	28	add_reviewimage
106	Can change Фото отзыва	28	change_reviewimage
107	Can delete Фото отзыва	28	delete_reviewimage
108	Can view Фото отзыва	28	view_reviewimage
109	Can add История цены	26	add_pricehistory
110	Can change История цены	26	change_pricehistory
111	Can delete История цены	26	delete_pricehistory
112	Can view История цены	26	view_pricehistory
113	Can add Скидка	25	add_discount
114	Can change Скидка	25	change_discount
115	Can delete Скидка	25	delete_discount
116	Can view Скидка	25	view_discount
117	Can add Корзина	29	add_cart
118	Can change Корзина	29	change_cart
119	Can delete Корзина	29	delete_cart
120	Can view Корзина	29	view_cart
121	Can add Просмотренный товар	30	add_viewedproduct
122	Can change Просмотренный товар	30	change_viewedproduct
123	Can delete Просмотренный товар	30	delete_viewedproduct
124	Can view Просмотренный товар	30	view_viewedproduct
125	Can add Избранное	31	add_wishlist
126	Can change Избранное	31	change_wishlist
127	Can delete Избранное	31	delete_wishlist
128	Can view Избранное	31	view_wishlist
129	Can add Видео товара	32	add_productvideo
130	Can change Видео товара	32	change_productvideo
131	Can delete Видео товара	32	delete_productvideo
132	Can view Видео товара	32	view_productvideo
133	Can add Уровень лояльности	37	add_loyaltyprogram
134	Can change Уровень лояльности	37	change_loyaltyprogram
135	Can delete Уровень лояльности	37	delete_loyaltyprogram
136	Can view Уровень лояльности	37	view_loyaltyprogram
137	Can add Лояльность клиента	36	add_customerloyalty
138	Can change Лояльность клиента	36	change_customerloyalty
139	Can delete Лояльность клиента	36	delete_customerloyalty
140	Can view Лояльность клиента	36	view_customerloyalty
141	Can add Промокод	34	add_coupon
142	Can change Промокод	34	change_coupon
143	Can delete Промокод	34	delete_coupon
144	Can view Промокод	34	view_coupon
145	Can add Использование купона	35	add_couponusage
146	Can change Использование купона	35	change_couponusage
147	Can delete Использование купона	35	delete_couponusage
148	Can view Использование купона	35	view_couponusage
149	Can add Лог изменений	33	add_changelog
150	Can change Лог изменений	33	change_changelog
151	Can delete Лог изменений	33	delete_changelog
152	Can view Лог изменений	33	view_changelog
153	Can add Поставщик	42	add_supplier
154	Can change Поставщик	42	change_supplier
155	Can delete Поставщик	42	delete_supplier
156	Can view Поставщик	42	view_supplier
157	Can add Сертификат / документ	40	add_certificate
158	Can change Сертификат / документ	40	change_certificate
159	Can delete Сертификат / документ	40	delete_certificate
160	Can view Сертификат / документ	40	view_certificate
161	Can add Гарантия	43	add_warranty
162	Can change Гарантия	43	change_warranty
163	Can delete Гарантия	43	delete_warranty
164	Can view Гарантия	43	view_warranty
165	Can add Баннер	38	add_banner
166	Can change Баннер	38	change_banner
167	Can delete Баннер	38	delete_banner
168	Can view Баннер	38	view_banner
169	Can add Статья блога	39	add_blogpost
170	Can change Статья блога	39	change_blogpost
171	Can delete Статья блога	39	delete_blogpost
172	Can view Статья блога	39	view_blogpost
173	Can add Промо-блок	41	add_promotionblock
174	Can change Промо-блок	41	change_promotionblock
175	Can delete Промо-блок	41	delete_promotionblock
176	Can view Промо-блок	41	view_promotionblock
177	Can add Услуга	44	add_serviceitem
178	Can change Услуга	44	change_serviceitem
179	Can delete Услуга	44	delete_serviceitem
180	Can view Услуга	44	view_serviceitem
181	Can add Раздел админки	45	add_adminsection
182	Can change Раздел админки	45	change_adminsection
183	Can delete Раздел админки	45	delete_adminsection
184	Can view Раздел админки	45	view_adminsection
\.


--
-- Data for Name: customers_address; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_address (id, title, first_name, last_name, phone, country, city, street, house, apartment, postal_code, is_default, created_at, customer_id) FROM stdin;
\.


--
-- Data for Name: customers_cart; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_cart (id, session_key, quantity, added_at, updated_at, customer_id, product_id, variant_id) FROM stdin;
\.


--
-- Data for Name: customers_changelog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_changelog (id, action, model_name, object_id, object_repr, changes, ip_address, created_at, user_id) FROM stdin;
\.


--
-- Data for Name: customers_coupon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_coupon (id, code, discount_type, value, min_order_amount, max_uses, used_count, max_uses_per_user, is_active, start_date, end_date, created_at) FROM stdin;
\.


--
-- Data for Name: customers_couponusage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_couponusage (id, discount_amount, used_at, coupon_id, customer_id, order_id) FROM stdin;
\.


--
-- Data for Name: customers_customer; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_customer (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email, nickname) FROM stdin;
2	pbkdf2_sha256$1200000$iCZN3d5y4JBgouDYR0GzXE$LhfezN1byB3W5+OFRNdnjCm8NFzdDAf7hLQoUqbO5E0=	\N	t			t	t	2026-07-09 13:28:11.186157+00	god1@gmail.com	god
4	pbkdf2_sha256$1200000$7Tsx055aNPnbvZSwrYXdhO$2j85F2wqApHnlKF7gU6mXRc994+QLTEbl91EHhSddk0=	2026-07-20 14:17:08.731329+00	t			t	t	2026-07-11 16:21:05.956767+00	god3@gmail.com	god3
1	pbkdf2_sha256$1200000$IVgcaO3i5WsayMEmFl45Jn$gQfNUwgicBmzyFz9OzUPazw9MRsJKk0x/hxQZMXWeK4=	2026-07-29 06:02:47.678963+00	f			t	t	2026-07-08 06:04:14+00	god@gmail.com	god
3	pbkdf2_sha256$1200000$TfVq0zWZKusQOEKVIJf9z0$PbPryN5BQfXhEJtYNCG+FuQ/+txdM5CNnO/fSr7zqDY=	2026-07-29 06:10:11.223365+00	t			t	t	2026-07-09 13:34:16.284408+00	god2@gmail.com	god
\.


--
-- Data for Name: customers_customer_groups; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_customer_groups (id, customer_id, group_id) FROM stdin;
\.


--
-- Data for Name: customers_customer_user_permissions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_customer_user_permissions (id, customer_id, permission_id) FROM stdin;
\.


--
-- Data for Name: customers_customerloyalty; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_customerloyalty (id, total_orders, total_spent, updated_at, customer_id, level_id) FROM stdin;
\.


--
-- Data for Name: customers_delivery; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_delivery (id, address_snapshot, tracking_number, courier, status, estimated_date, delivered_at, created_at, address_id, order_id) FROM stdin;
\.


--
-- Data for Name: customers_loyaltyprogram; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_loyaltyprogram (id, name, slug, description, min_orders, min_spent, discount_percent, free_shipping, priority_support, is_active, sort_order) FROM stdin;
\.


--
-- Data for Name: customers_order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_order (id, order_number, status, first_name, last_name, email, phone1, phone2, address, comments, total_amount, created_at, updated_at, customer_id) FROM stdin;
1	ORD-483ECAE6	pending	Родион	Витенберг	rodionvitenberg@gmail.com	+996 550 418 317		Moskow 162	Сосите!	67800.00	2026-07-09 13:24:47.807865+00	2026-07-09 13:24:47.839729+00	\N
2	ORD-EA1A8231	pending	Winter	Wind	god@gmail.com	123		132		27500.00	2026-07-09 13:29:45.923536+00	2026-07-09 13:29:45.935027+00	\N
3	ORD-C93F09F2	pending								22600.00	2026-07-09 13:41:48.967085+00	2026-07-09 13:41:49.00417+00	\N
4	ORD-F82B4706	pending	Winter	Wind	2313@gmail.com	+996 550 418 317		Moskow 162		22600.00	2026-07-09 13:52:09.950012+00	2026-07-09 13:52:09.976072+00	\N
5	ORD-CF553390	pending	12	12	12	12		12		64800.00	2026-07-09 13:56:49.929179+00	2026-07-09 13:56:49.945656+00	\N
6	ORD-9FA4D2D9	pending	Rodion	Vitenberg		+996550418317		Moscow Street 92\nRakhmanova 95		27500.00	2026-07-10 14:00:29.364806+00	2026-07-10 14:00:29.39974+00	\N
9	ORD-E19AB90A	pending	Rodion	Vitenberg		+996550418317		Moscow Street 92\nRakhmanova 95		57800.00	2026-07-20 14:17:37.220711+00	2026-07-20 14:17:37.220725+00	\N
11	ORD-2C8A2655	pending	Rodion	Vitenberg		+996550418317		Moscow Street 92\nRakhmanova 95		62400.00	2026-07-20 14:39:33.151429+00	2026-07-20 14:39:33.151471+00	\N
15	Rodion-1	pending	Rodion	Vitenberg		+996550418317		Moscow Street 92\nRakhmanova 95		57800.00	2026-07-20 15:41:51.084929+00	2026-07-20 15:41:51.084999+00	\N
\.


--
-- Data for Name: customers_orderitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_orderitem (id, quantity, price, order_id, product_id, variant_id) FROM stdin;
\.


--
-- Data for Name: customers_orderstatushistory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_orderstatushistory (id, old_status, new_status, comment, created_at, changed_by_id, order_id) FROM stdin;
1		pending		2026-07-09 13:24:47.84367+00	\N	1
2		pending		2026-07-09 13:29:45.938434+00	\N	2
3		pending		2026-07-09 13:41:49.009223+00	\N	3
4		pending		2026-07-09 13:52:09.981872+00	\N	4
5		pending		2026-07-09 13:56:49.949389+00	\N	5
6		pending		2026-07-10 14:00:29.409146+00	\N	6
9		pending		2026-07-20 14:17:37.242761+00	\N	9
11		pending		2026-07-20 14:39:33.169854+00	\N	11
15		pending		2026-07-20 15:41:51.131896+00	\N	15
\.


--
-- Data for Name: customers_payment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_payment (id, method, status, amount, external_id, paid_at, created_at, order_id) FROM stdin;
\.


--
-- Data for Name: customers_viewedproduct; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_viewedproduct (id, viewed_at, view_count, customer_id, product_id) FROM stdin;
\.


--
-- Data for Name: customers_wishlist; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.customers_wishlist (id, created_at, customer_id, product_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2026-07-08 06:21:22.220055+00	1	Компьютеры	1	[{"added": {}}]	10	1
2	2026-07-08 13:11:07.115335+00	106	Intel Core i5-14600K	2	[{"changed": {"fields": ["\\u041d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0430"]}}]	11	1
3	2026-07-09 05:50:47.042854+00	106	Intel Core i5-14600K	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
4	2026-07-09 05:50:54.856058+00	105	Cooler Master MasterBox TD500 Mesh V2	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
5	2026-07-09 05:51:02.695525+00	104	HyperX Cloud III Wireless	2	[{"changed": {"fields": ["\\u041d\\u043e\\u0432\\u0438\\u043d\\u043a\\u0430", "\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
6	2026-07-09 05:51:13.907801+00	102	Razer DeathAdder V3 Pro	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
7	2026-07-09 05:51:23.650627+00	101	Logitech G Pro X Superlight 2	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
8	2026-07-09 05:51:33.346638+00	97	ASUS ROG Swift PG32UCDM	2	[{"changed": {"fields": ["\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u044b\\u0439"]}}]	11	1
9	2026-07-09 05:59:48.66568+00	76	SATA3	1	[{"added": {}}]	10	1
10	2026-07-09 09:20:20.087374+00	77	M2	1	[{"added": {}}]	10	1
11	2026-07-09 09:20:53.554779+00	77	M2	3		10	1
12	2026-07-09 09:20:53.554821+00	76	SATA3	3		10	1
13	2026-07-09 17:57:56.480371+00	1	Анал	1	[{"added": {}}]	44	1
14	2026-07-10 15:34:49.815345+00	103	Объём SSD	2	[{"changed": {"fields": ["Slug", "\\u0415\\u0434\\u0438\\u043d\\u0438\\u0446\\u0430 \\u0438\\u0437\\u043c\\u0435\\u0440\\u0435\\u043d\\u0438\\u044f"]}}]	9	1
15	2026-07-11 15:17:37.345145+00	252	Acer	2	[]	15	1
16	2026-07-11 15:27:22.946225+00	1	god@gmail.com	2	[{"changed": {"fields": ["Superuser status"]}}]	6	1
17	2026-07-18 04:51:14.589927+00	162	Видеонаблюдение	1	[{"added": {}}]	10	4
18	2026-07-18 04:51:31.621408+00	158	Аксессуары	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u0445\\u0435\\u0434\\u0435\\u0440\\u0435"]}}]	10	4
19	2026-07-18 04:51:31.622739+00	162	Видеонаблюдение	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u0445\\u0435\\u0434\\u0435\\u0440\\u0435"]}}]	10	4
20	2026-07-18 04:51:43.947582+00	162	Видеонаблюдение	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u0445\\u0435\\u0434\\u0435\\u0440\\u0435"]}}]	10	4
21	2026-07-18 04:51:43.949576+00	158	Аксессуары	2	[{"changed": {"fields": ["\\u041f\\u043e\\u0440\\u044f\\u0434\\u043e\\u043a \\u0432 \\u0445\\u0435\\u0434\\u0435\\u0440\\u0435"]}}]	10	4
22	2026-07-18 07:07:49.9075+00	163	TurboHD камеры	1	[{"added": {}}]	10	4
23	2026-07-18 07:09:50.204943+00	164	IP камеры	1	[{"added": {}}]	10	4
24	2026-07-18 07:10:34.676914+00	164	IP камеры	2	[{"changed": {"fields": ["\\u0420\\u043e\\u0434\\u0438\\u0442\\u0435\\u043b\\u044c\\u0441\\u043a\\u0430\\u044f \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f"]}}]	10	4
25	2026-07-18 07:11:47.628507+00	165	Расходные материалы	1	[{"added": {}}]	10	4
26	2026-07-18 07:13:26.013212+00	1	Анал	3		44	4
27	2026-07-18 07:13:46.702294+00	2	Заправка картриджа (1010/1005)	1	[{"added": {}}]	44	4
28	2026-07-18 07:14:03.95245+00	3	Заправка картриджа (132)	1	[{"added": {}}]	44	4
29	2026-07-18 07:14:41.658591+00	4	Переустановка Windows	1	[{"added": {}}]	44	4
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	contenttypes	contenttype
5	sessions	session
6	customers	customer
7	customers	order
8	customers	orderitem
9	products	attribute
10	products	category
11	products	product
12	products	productattribute
13	products	productimage
14	products	review
16	notifications	notificationlog
17	notifications	notificationsettings
15	products	brand
18	products	productvariant
19	products	stock
20	products	tag
21	customers	address
22	customers	delivery
23	customers	orderstatushistory
24	customers	payment
25	products	discount
26	products	pricehistory
27	products	promocampaign
28	products	reviewimage
29	customers	cart
30	customers	viewedproduct
31	customers	wishlist
32	products	productvideo
33	customers	changelog
34	customers	coupon
35	customers	couponusage
36	customers	customerloyalty
37	customers	loyaltyprogram
38	products	banner
39	products	blogpost
40	products	certificate
41	products	promotionblock
42	products	supplier
43	products	warranty
44	services	serviceitem
45	products	adminsection
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2026-07-07 13:24:23.105911+00
2	contenttypes	0002_remove_content_type_name	2026-07-07 13:24:23.117241+00
3	auth	0001_initial	2026-07-07 13:24:23.159563+00
4	auth	0002_alter_permission_name_max_length	2026-07-07 13:24:23.168922+00
5	auth	0003_alter_user_email_max_length	2026-07-07 13:24:23.177177+00
6	auth	0004_alter_user_username_opts	2026-07-07 13:24:23.186843+00
7	auth	0005_alter_user_last_login_null	2026-07-07 13:24:23.195127+00
8	auth	0006_require_contenttypes_0002	2026-07-07 13:24:23.198747+00
9	auth	0007_alter_validators_add_error_messages	2026-07-07 13:24:23.207915+00
10	auth	0008_alter_user_username_max_length	2026-07-07 13:24:23.215488+00
11	auth	0009_alter_user_last_name_max_length	2026-07-07 13:24:23.2261+00
12	auth	0010_alter_group_name_max_length	2026-07-07 13:24:23.236136+00
13	auth	0011_update_proxy_permissions	2026-07-07 13:24:23.246131+00
14	auth	0012_alter_user_first_name_max_length	2026-07-07 13:24:23.255087+00
15	customers	0001_initial	2026-07-07 13:24:23.318664+00
16	admin	0001_initial	2026-07-07 13:24:23.347058+00
17	admin	0002_logentry_remove_auto_add	2026-07-07 13:24:23.359824+00
18	admin	0003_logentry_add_action_flag_choices	2026-07-07 13:24:23.374071+00
19	products	0001_initial	2026-07-07 13:24:23.489078+00
20	customers	0002_orderitem	2026-07-07 13:24:23.519709+00
21	sessions	0001_initial	2026-07-07 13:24:23.529905+00
22	products	0002_rename_tag_brand_remove_category_tags_and_more	2026-07-07 16:45:55.81858+00
23	products	0003_tag_product_feature_tags	2026-07-07 16:46:15.36803+00
24	products	0004_productvariant_stock_alter_productimage_options_and_more	2026-07-07 16:46:21.250014+00
25	products	0005_promocampaign_category_h1_category_meta_description_and_more	2026-07-07 17:10:11.141874+00
26	customers	0003_orderitem_variant_address_delivery_and_more	2026-07-07 17:10:11.343318+00
27	products	0006_brand_country_brand_description_brand_logo_and_more	2026-07-07 17:14:38.723126+00
28	customers	0004_cart_viewedproduct_wishlist	2026-07-07 17:14:38.925343+00
29	customers	0005_coupon_loyaltyprogram_couponusage_customerloyalty_and_more	2026-07-07 17:17:33.47441+00
30	products	0007_supplier_banner_certificate_promotionblock_warranty_and_more	2026-07-07 17:21:39.656653+00
31	notifications	0001_initial	2026-07-08 06:07:49.483191+00
32	customers	0006_alter_order_email	2026-07-09 13:31:43.394096+00
33	customers	0007_alter_order_address_alter_order_first_name_and_more	2026-07-09 13:46:36.740433+00
34	services	0001_initial	2026-07-09 17:54:08.794188+00
35	products	0008_adminsection_alter_certificate_options_and_more	2026-07-11 15:41:22.973893+00
36	products	0009_brand_logo_provenance_productimage_provenance	2026-07-13 06:25:34.154118+00
37	products	0009_productimage_provenance	2026-07-14 06:53:31.033617+00
38	products	0009_brand_is_active	2026-07-18 04:41:40.11661+00
39	products	0010_category_image	2026-07-18 05:01:29.91106+00
40	products	0011_brand_logo_provenance	2026-07-21 07:36:16.69586+00
41	products	0012_add_productimage_provenance	2026-07-29 06:07:40.98286+00
42	products	0013_blogpost_noindex_category_noindex_and_more	2026-07-29 11:02:16.799417+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
95k9y2a7mkrt2yezda999w2abh6ptnto	.eJxVjM0OwiAQhN-FsyGWnwIevfsMZJddbNVAUtqT8d2lSQ-auX3zzbxFhG2d4tZ4iTOJixjE6ZchpCeXvaAHlHuVqZZ1mVHuijzaJm-V-HU93L-DCdrU16gHBmdGNkQhcUDTg9bBmINVZsxoMinvgBx1AvacNCYHjCoY7b34fAENUDjV:1whmQk:bdEXlySxeG32BppEVYgnVcROGtnfPeBJsUpOruz_Eos	2026-07-10 10:56:34.402997+00
pjeubsdt9e0g1z030xt0hkmye5goyc5k	.eJxVjEEOgjAQRe_StWko0JZx6d4zNL8zg6AGEgor492VhIVu_3vvv0zCtg5pK7qkUczZtOb0u2XwQ6cdyB3TbbY8T-syZrsr9qDFXmfR5-Vw_w4GlOFba9Or-pDV1eIgVew6rkAxOACtduRrjaTQTAwOQN-wkBPUlNVHMu8PFb05XQ:1wl0TW:rhY3F1oHfDzUz3RTEqLRwh_xd9uIc8lJ-wSNNRygu4A	2026-07-19 08:32:46.464889+00
un58th45z1jrxm42kzgfji5sqn3u84gy	.eJxVjEEOgjAQRe_StWko0JZx6d4zNL8zg6AGEgor492VhIVu_3vvv0zCtg5pK7qkUczZtOb0u2XwQ6cdyB3TbbY8T-syZrsr9qDFXmfR5-Vw_w4GlOFba9Or-pDV1eIgVew6rkAxOACtduRrjaTQTAwOQN-wkBPUlNVHMu8PFb05XQ:1wlons:-NDGlXTJmiC6NyHGRM2JlAuTMopWoW01Ctdg-NspJjA	2026-07-21 14:17:08.89963+00
g4h9rt7z7fpdcqp481amgixl04ea5g1n	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1whsad:cAWnwljKVOya0W3WpXFT78lqeZYU14UXp0R9XzPsads	2026-07-10 17:31:11.356566+00
jt4lma1sk06ztt583t10so7wvyx8dov1	.eJxVjM0OwiAQhN-FsyGWnwIevfsMZJddbNVAUtqT8d2lSQ-auX3zzbxFhG2d4tZ4iTOJixjE6ZchpCeXvaAHlHuVqZZ1mVHuijzaJm-V-HU93L-DCdrU16gHBmdGNkQhcUDTg9bBmINVZsxoMinvgBx1AvacNCYHjCoY7b34fAENUDjV:1woxNX:fyorPRBH9Ynbbz4zlpvX374lr34ZdoUvKjlBGkRVmvs	2026-07-30 06:02:55.749379+00
tlgreuiimnyaclh72la5fk25mqgcdq67	.eJxVjEEOgjAQRe_StWko0JZx6d4zNL8zg6AGEgor492VhIVu_3vvv0zCtg5pK7qkUczZtOb0u2XwQ6cdyB3TbbY8T-syZrsr9qDFXmfR5-Vw_w4GlOFba9Or-pDV1eIgVew6rkAxOACtduRrjaTQTAwOQN-wkBPUlNVHMu8PFb05XQ:1wiaTw:9UEfpgkd5h9S-BpNfBJ_VYL4aBcB-ShsloKJOO9DFW0	2026-07-12 16:23:12.69687+00
p93g6atq33tgxa942oiezkm7x1bqhfit	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1wjAc4:5elCf-pcJAIOsXYRD2sfriTdPLVCxi5lFWPOB3PftL8	2026-07-14 06:58:00.428499+00
zqteuk7rm20m1nlr3sfzdarcasgtuv7a	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1woxUp:wOwX4Bas4Xwk42pAB0-27gXCKxfWyw6-7LL5v-Vvvkw	2026-07-30 06:10:27.485395+00
3sz8erotws12rsjwv5aj4xwi8jwhbuyg	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1wjdOn:0zU3LC3jQe5ttLTdfdIP1mHljMtsJTLe7830LE727eo	2026-07-15 13:42:13.828317+00
9k5hubwkbkxwz19c3eriycpc6c8cfc8y	.eJxVjEEOwiAUBe_C2hAIhVKX7j0Def8DUjWQlHZlvLs26UK3b2beSwRsawlbT0uYozgLI06_G4Efqe4g3lFvTXKr6zKT3BV50C6vLabn5XD_Dgp6-dZ5Stlmx4hs2BlMoyLLZJTxYAefR0-stEEEGFr7rAa2lpIf4BRF8f4AHDM5PA:1wkP3g:HYUQ482QS3q5dMUwu9lxUAgpvgqSt7l50TZ-nYkUTXA	2026-07-17 16:35:36.407536+00
\.


--
-- Data for Name: notifications_notificationlog; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications_notificationlog (id, notification_type, status, message, recipient, error_message, created_at, sent_at, order_id) FROM stdin;
\.


--
-- Data for Name: notifications_notificationsettings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notifications_notificationsettings (id, name, telegram_enabled, telegram_chat_id, email_enabled, email_address, notify_new_orders, notify_status_changes, created_at, updated_at) FROM stdin;
1	Основные уведомления	t		f		t	f	2026-07-09 13:24:47.825445+00	2026-07-09 13:24:47.825456+00
\.


--
-- Data for Name: products_adminsection; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_adminsection (id, key, label, is_visible, is_visible_by_default, sort_order) FROM stdin;
1	catalog_base	Каталог (товары, категории, бренды)	t	t	10
2	orders	Заказы и клиенты	t	t	20
3	services	Сервис (услуги)	t	t	30
4	blog	Блог	t	t	40
5	users	Пользователи	t	t	50
6	attributes	Атрибуты	t	f	60
7	tags	Теги	t	f	70
8	variants	Варианты товаров	t	f	80
9	stock	Остатки (склад)	t	f	90
10	suppliers	Поставщики	t	f	100
11	promocampaigns	Акции	t	f	110
12	discounts	Скидки	t	f	120
13	pricehistory	История цен	t	f	130
14	videos	Видео товаров	t	f	140
15	warranties	Гарантии	t	f	150
16	certificates	Сертификаты	t	f	160
17	promoblocks	Промо-блоки	t	f	170
18	coupons	Промокоды	t	f	180
19	loyalty	Программа лояльности	t	f	190
20	banners	Баннеры	t	f	200
21	changelog	Лог изменений	t	f	210
22	groups	Группы и права	t	f	220
\.


--
-- Data for Name: products_attribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_attribute (id, name, slug, unit, enum_options, type) FROM stdin;
265	Частота процессора	cpu-frequency	GHz	\N	int
266	Макс. частота (Boost)	max-boost-frequency	GHz	\N	int
267	Количество ядер	cores		\N	int
268	Количество потоков	threads		\N	int
269	Сокет	socket		["LGA1700", "LGA1200", "AM5", "AM4", "TR4", "sTRX4"]	enum
270	Техпроцесс	manufacturing-tech		\N	str
271	TDP	tdp	W	\N	int
272	Объём видеопамяти	vram	GB	\N	int
273	Тип видеопамяти	vram-type		["GDDR6", "GDDR6X", "GDDR5", "GDDR5X", "HBM2"]	enum
274	Шина памяти	memory-bus	bit	\N	int
275	Объём ОЗУ	ram-capacity	GB	\N	int
276	Тип ОЗУ	ram-type		["DDR5", "DDR4", "DDR3"]	enum
277	Частота ОЗУ	ram-frequency	MHz	\N	int
278	Количество планок	ram-modules		\N	int
279	Объём накопителя	storage-capacity	GB	\N	int
280	Тип накопителя	storage-type		["SSD", "HDD", "NVMe", "M.2 SATA"]	enum
281	Форм-фактор	form-factor		["2.5\\"", "3.5\\"", "M.2 2280", "M.2 2230", "mSATA", "ATX", "microATX", "Mini-ITX"]	enum
282	Скорость чтения	read-speed	MB/s	\N	int
283	Скорость записи	write-speed	MB/s	\N	int
284	Мощность БП	psu-wattage	W	\N	int
285	Сертификат	certification		["80+ Bronze", "80+ Silver", "80+ Gold", "80+ Platinum", "80+ Titanium", "80+"]	enum
286	Модульность	modularity		["Non-modular", "Semi-modular", "Fully modular"]	enum
287	Диагональ экрана	screen-size		\N	str
288	Разрешение	resolution		\N	str
289	Тип матрицы	panel-type		["IPS", "VA", "TN", "OLED", "Nano IPS", "Fast IPS"]	enum
290	Частота обновления	refresh-rate	Hz	\N	int
291	Время отклика	response-time	ms	\N	int
292	Изогнутый	curved		\N	bool
293	Яркость	brightness	cd/m²	\N	int
294	Диагональ ноутбука	laptop-screen-size		\N	str
295	Процессор (модель)	cpu-model		\N	str
296	Видеокарта (модель)	gpu-model		\N	str
297	Объём RAM	laptop-ram	GB	\N	int
298	Объём SSD	laptop-ssd	GB	\N	int
299	Вес	weight		\N	str
300	Цвет	color		\N	str
301	Подсветка	backlight		\N	bool
302	Беспроводной	wireless		\N	bool
303	Механические переключатели	mechanical-switches		\N	bool
\.


--
-- Data for Name: products_banner; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_banner (id, title, subtitle, image, image_mobile, link, placement, is_active, sort_order, start_date, end_date, created_at, category_id) FROM stdin;
\.


--
-- Data for Name: products_blogpost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blogpost (id, title, slug, excerpt, content, image, status, meta_title, meta_description, published_at, created_at, updated_at, author_id, noindex) FROM stdin;
\.


--
-- Data for Name: products_blogpost_related_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blogpost_related_products (id, blogpost_id, product_id) FROM stdin;
\.


--
-- Data for Name: products_blogpost_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_blogpost_tags (id, blogpost_id, tag_id) FROM stdin;
\.


--
-- Data for Name: products_brand; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_brand (id, name, slug, country, description, logo, website, logo_provenance, is_active) FROM stdin;
335	Logitech	logitech	Switzerland		brand_logos/logitech.png	https://www.logitech.com	wikipedia	t
351	Fractal Design	fractal-design	Sweden		brand_logos/fractal-design.png	https://www.fractal-design.com	favicon	t
337	Acer	acer	Taiwan		brand_logos/acer.png	https://www.acer.com	wikipedia	t
321	AMD	amd	USA		brand_logos/amd.png	https://www.amd.com	wikipedia	t
322	NVIDIA	nvidia	USA		brand_logos/nvidia.png	https://www.nvidia.com	wikipedia	t
320	Intel	intel	USA		brand_logos/intel.png	https://www.intel.com	wikipedia	t
338	Cooler Master	cooler-master	Taiwan		brand_logos/cooler-master.png	https://www.coolermaster.com	simpleicons	t
324	MSI	msi	Taiwan		brand_logos/msi.png	https://www.msi.com	wikipedia	t
323	ASUS	asus	Taiwan		brand_logos/asus.png	https://www.asus.com	wikipedia	t
353	Lian Li	lian-li	Taiwan		brand_logos/lian-li.png	https://www.lian-li.com	wikipedia	t
326	Samsung	samsung	South Korea		brand_logos/samsung.png	https://www.samsung.com	wikipedia	t
341	HyperX	hyperx	USA		brand_logos/hyperx.png	https://www.hyperxgaming.com	simpleicons	t
328	Dell	dell	USA		brand_logos/dell.png	https://www.dell.com	wikipedia	t
354	TeamGroup	teamgroup	Taiwan		brand_logos/teamgroup.svg	https://www.teamgroup.com	fallback	t
327	LG	lg	South Korea		brand_logos/lg.png	https://www.lg.com	simpleicons	t
340	Seasonic	seasonic	Taiwan		brand_logos/seasonic.png	https://www.seasonic.com	favicon	t
329	HP	hp	USA		brand_logos/hp.png	https://www.hp.com	wikipedia	t
352	NZXT	nzxt	USA		brand_logos/nzxt.png	https://www.nzxt.com	simpleicons	t
330	Lenovo	lenovo	China		brand_logos/lenovo.png	https://www.lenovo.com	wikipedia	t
343	BenQ	benq	Taiwan		brand_logos/benq.png	https://www.benq.com	wikipedia	t
331	Corsair	corsair	USA		brand_logos/corsair.png	https://www.corsair.com	simpleicons	t
333	Seagate	seagate	Ireland		brand_logos/seagate.png	https://www.seagate.com	wikipedia	t
342	SteelSeries	steelseries	Denmark		brand_logos/steelseries.png	https://www.steelseries.com	simpleicons	t
334	Western Digital	western-digital	USA		brand_logos/western-digital.png	https://www.westerndigital.com	wikipedia	t
356	Toshiba	toshiba	Japan		brand_logos/toshiba.png	https://www.toshiba.com	wikipedia	t
336	Razer	razer	USA		brand_logos/razer.png	https://www.razer.com	wikipedia	t
355	Patriot	patriot	USA		brand_logos/patriot.svg	https://www.patriot.com	fallback	t
345	DeepCool	deepcool	China		brand_logos/deepcool.png	https://www.deepcool.com	simpleicons	t
357	Keychron	keychron	China		brand_logos/keychron.png	https://www.keychron.com	favicon	t
344	Noctua	noctua	Austria		brand_logos/noctua.png	https://www.noctua.at	favicon	t
346	Arctic	arctic	Germany		brand_logos/arctic.png	https://www.arctic.de	favicon	t
360	Apple	apple	USA		brand_logos/apple.png	https://www.apple.com	wikipedia	t
358	Ducky	ducky	Taiwan		brand_logos/ducky.svg	https://www.duckychannel.com	fallback	t
348	Crucial	crucial	USA		brand_logos/crucial.png	https://www.crucial.com	favicon	t
347	G.Skill	gskill	Taiwan		brand_logos/gskill.png	https://www.gskill.com	favicon	t
325	Gigabyte	gigabyte	Taiwan		brand_logos/gigabyte.svg	https://www.gigabyte.com	fallback	t
359	Zowie	zowie	Taiwan		brand_logos/zowie.svg	https://www.zowie.com	fallback	t
332	Kingston	kingston	USA		brand_logos/kingston.svg	https://www.kingston.com	fallback	t
339	be quiet!	be-quiet	Germany		brand_logos/be-quiet.svg	https://www.bequiet.com	fallback	t
361	Thermalright	thermalright	China		brand_logos/thermalright.svg	https://www.thermalright.com	fallback	t
349	ASRock	asrock	Taiwan		brand_logos/asrock.svg	https://www.asrock.com	fallback	t
350	EVGA	evga	USA		brand_logos/evga.svg	https://www.evga.com	fallback	t
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_category (id, name, slug, header_order, parent_id, h1, meta_description, meta_title, image, noindex, page_description) FROM stdin;
208	Охлаждение	cooling	0	199					f	
209	Компьютеры	computers	2	\N					f	
199	Комплектующие	components	1	\N					f	
200	Процессоры	processors	0	199					f	
201	Видеокарты	videocards	0	199					f	
202	Материнские платы	motherboards	0	199					f	
203	Оперативная память	ram	0	199					f	
204	Накопители SSD	ssd	0	199					f	
205	Жёсткие диски	hdd	0	199					f	
206	Блоки питания	psu	0	199					f	
207	Корпуса	cases	0	199					f	
210	Игровые ПК	gaming-pcs	0	209					f	
211	Офисные ПК	office-pcs	0	209					f	
212	Рабочие станции	workstations	0	209					f	
213	Игровые ноутбуки	gaming-laptops	0	209					f	
214	Ультрабуки	ultrabooks	0	209					f	
215	Рабочие ноутбуки	work-laptops	0	209					f	
216	Мониторы	monitors	3	\N					f	
217	Игровые мониторы	gaming-monitors	0	216					f	
218	Профессиональные мониторы	professional-monitors	0	216					f	
219	Офисные мониторы	office-monitors	0	216					f	
220	Периферия	peripherals	4	\N					f	
221	Клавиатуры	keyboards	0	220					f	
222	Мыши	mice	0	220					f	
223	Гарнитуры	headsets	0	220					f	
224	Коврики	mousepads	0	220					f	
225	МФУ и принтеры	mfu-printers	5	\N					f	
226	Цветные МФУ и принтеры	color-mfu-printers	0	225					f	
227	Картриджи, чернила и пр.	cartridges-inks	0	225					f	
228	Аксессуары	accessories	6	\N					f	
229	Кабели и переходники	cables-adapters	0	228					f	
230	Чехлы и сумки	cases-bags	0	228					f	
231	Веб-камеры	webcams	0	228					f	
\.


--
-- Data for Name: products_category_attributes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_category_attributes (id, category_id, attribute_id) FROM stdin;
\.


--
-- Data for Name: products_category_brands; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_category_brands (id, category_id, brand_id) FROM stdin;
\.


--
-- Data for Name: products_certificate; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_certificate (id, title, file, sort_order, created_at, product_id) FROM stdin;
\.


--
-- Data for Name: products_discount; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_discount (id, discount_type, value, is_active, start_date, end_date, min_quantity, category_id, product_id, variant_id, promo_campaign_id) FROM stdin;
\.


--
-- Data for Name: products_pricehistory; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_pricehistory (id, old_price, new_price, changed_at, reason, product_id, variant_id) FROM stdin;
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_product (id, name, description, price, is_active, is_new, is_favorite, slug, h1, meta_description, meta_title, noindex) FROM stdin;
395	Intel Core i9-14900K	Intel Core i9-14900K — отличный выбор для сборки или апгрейда вашего ПК.	48500.00	t	f	t	intel-core-i9-14900k				f
396	Intel Core i7-14700K	Intel Core i7-14700K — отличный выбор для сборки или апгрейда вашего ПК.	34200.00	t	f	f	intel-core-i7-14700k				f
397	Intel Core i5-14600K	Intel Core i5-14600K — отличный выбор для сборки или апгрейда вашего ПК.	27500.00	t	f	f	intel-core-i5-14600k				f
398	Intel Core i3-14100F	Intel Core i3-14100F — отличный выбор для сборки или апгрейда вашего ПК.	12400.00	t	t	f	intel-core-i3-14100f				f
399	AMD Ryzen 9 7950X3D	AMD Ryzen 9 7950X3D — отличный выбор для сборки или апгрейда вашего ПК.	57800.00	t	f	t	amd-ryzen-9-7950x3d				f
400	AMD Ryzen 7 7800X3D	AMD Ryzen 7 7800X3D — отличный выбор для сборки или апгрейда вашего ПК.	33800.00	t	f	t	amd-ryzen-7-7800x3d				f
401	AMD Ryzen 5 7600X	AMD Ryzen 5 7600X — отличный выбор для сборки или апгрейда вашего ПК.	21800.00	t	f	f	amd-ryzen-5-7600x				f
402	AMD Ryzen 9 9950X	AMD Ryzen 9 9950X — отличный выбор для сборки или апгрейда вашего ПК.	62400.00	t	t	f	amd-ryzen-9-9950x				f
403	NVIDIA GeForce RTX 4090	NVIDIA GeForce RTX 4090 — отличный выбор для сборки или апгрейда вашего ПК.	158000.00	t	f	t	nvidia-geforce-rtx-4090				f
404	NVIDIA GeForce RTX 4080 Super	NVIDIA GeForce RTX 4080 Super — отличный выбор для сборки или апгрейда вашего ПК.	82600.00	t	f	f	nvidia-geforce-rtx-4080-super				f
405	NVIDIA GeForce RTX 4070 Super	NVIDIA GeForce RTX 4070 Super — отличный выбор для сборки или апгрейда вашего ПК.	54200.00	t	f	f	nvidia-geforce-rtx-4070-super				f
406	NVIDIA GeForce RTX 4060 Ti	NVIDIA GeForce RTX 4060 Ti — отличный выбор для сборки или апгрейда вашего ПК.	36400.00	t	f	f	nvidia-geforce-rtx-4060-ti				f
407	AMD Radeon RX 7900 XTX	AMD Radeon RX 7900 XTX — отличный выбор для сборки или апгрейда вашего ПК.	74800.00	t	f	f	amd-radeon-rx-7900-xtx				f
408	AMD Radeon RX 7800 XT	AMD Radeon RX 7800 XT — отличный выбор для сборки или апгрейда вашего ПК.	41600.00	t	f	f	amd-radeon-rx-7800-xt				f
409	AMD Radeon RX 7600	AMD Radeon RX 7600 — отличный выбор для сборки или апгрейда вашего ПК.	24800.00	t	t	f	amd-radeon-rx-7600				f
410	Intel Arc A770 16GB	Intel Arc A770 16GB — отличный выбор для сборки или апгрейда вашего ПК.	27600.00	t	t	f	intel-arc-a770-16gb				f
411	ASUS ROG STRIX Z790-F Gaming WiFi	ASUS ROG STRIX Z790-F Gaming WiFi — отличный выбор для сборки или апгрейда вашего ПК.	34200.00	t	f	f	asus-rog-strix-z790-f-gaming-wifi				f
412	Gigabyte Z790 AORUS Elite AX	Gigabyte Z790 AORUS Elite AX — отличный выбор для сборки или апгрейда вашего ПК.	25800.00	t	f	f	gigabyte-z790-aorus-elite-ax				f
413	ASUS TUF Gaming B760-PLUS WiFi	ASUS TUF Gaming B760-PLUS WiFi — отличный выбор для сборки или апгрейда вашего ПК.	18300.00	t	f	f	asus-tuf-gaming-b760-plus-wifi				f
414	MSI MAG B650 TOMAHAWK WiFi	MSI MAG B650 TOMAHAWK WiFi — отличный выбор для сборки или апгрейда вашего ПК.	19800.00	t	f	f	msi-mag-b650-tomahawk-wifi				f
415	ASRock B650M Pro RS WiFi	ASRock B650M Pro RS WiFi — отличный выбор для сборки или апгрейда вашего ПК.	14200.00	t	t	f	asrock-b650m-pro-rs-wifi				f
416	MSI MPG X670E Carbon WiFi	MSI MPG X670E Carbon WiFi — отличный выбор для сборки или апгрейда вашего ПК.	43200.00	t	f	f	msi-mpg-x670e-carbon-wifi				f
417	Gigabyte B550 AORUS Elite V2	Gigabyte B550 AORUS Elite V2 — отличный выбор для сборки или апгрейда вашего ПК.	12800.00	t	f	f	gigabyte-b550-aorus-elite-v2				f
418	ASUS ROG Crosshair X670E Hero	ASUS ROG Crosshair X670E Hero — отличный выбор для сборки или апгрейда вашего ПК.	58600.00	t	f	f	asus-rog-crosshair-x670e-hero				f
419	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz — отличный выбор для сборки или апгрейда вашего ПК.	9600.00	t	f	f	kingston-fury-beast-ddr5-32gb-2x16-5600mhz				f
420	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB — отличный выбор для сборки или апгрейда вашего ПК.	10200.00	t	f	f	corsair-vengeance-ddr5-32gb-2x16-6000mhz-rgb				f
421	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz — отличный выбор для сборки или апгрейда вашего ПК.	11800.00	t	t	f	gskill-trident-z5-rgb-ddr5-32gb-2x16-6400mhz				f
422	Crucial Pro DDR5 32GB (2×16GB) 5600MHz	Crucial Pro DDR5 32GB (2×16GB) 5600MHz — отличный выбор для сборки или апгрейда вашего ПК.	8400.00	t	f	f	crucial-pro-ddr5-32gb-2x16-5600mhz				f
423	Crucial Pro DDR4 32GB (2×16GB) 3200MHz	Crucial Pro DDR4 32GB (2×16GB) 3200MHz — отличный выбор для сборки или апгрейда вашего ПК.	6200.00	t	f	f	crucial-pro-ddr4-32gb-2x16-3200mhz				f
424	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz — отличный выбор для сборки или апгрейда вашего ПК.	21600.00	t	t	f	teamgroup-t-force-delta-rgb-ddr5-64gb-2x32-6000mhz				f
425	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz — отличный выбор для сборки или апгрейда вашего ПК.	4200.00	t	f	f	patriot-viper-steel-ddr4-16gb-2x8-3600mhz				f
426	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz — отличный выбор для сборки или апгрейда вашего ПК.	13400.00	t	f	f	kingston-fury-renegade-ddr5-32gb-2x16-7200mhz				f
427	Samsung 990 PRO 2TB NVMe M.2	Samsung 990 PRO 2TB NVMe M.2 — отличный выбор для сборки или апгрейда вашего ПК.	15600.00	t	f	f	samsung-990-pro-2tb-nvme-m2				f
428	WD Black SN850X 1TB NVMe M.2	WD Black SN850X 1TB NVMe M.2 — отличный выбор для сборки или апгрейда вашего ПК.	8300.00	t	f	f	wd-black-sn850x-1tb-nvme-m2				f
429	Kingston KC3000 2TB NVMe M.2	Kingston KC3000 2TB NVMe M.2 — отличный выбор для сборки или апгрейда вашего ПК.	13200.00	t	f	f	kingston-kc3000-2tb-nvme-m2				f
430	Crucial T700 1TB NVMe M.2 PCIe 5.0	Crucial T700 1TB NVMe M.2 PCIe 5.0 — отличный выбор для сборки или апгрейда вашего ПК.	14200.00	t	t	f	crucial-t700-1tb-nvme-m2-pcie-5				f
431	Samsung 870 EVO 1TB SATA 2.5"	Samsung 870 EVO 1TB SATA 2.5" — отличный выбор для сборки или апгрейда вашего ПК.	7200.00	t	f	f	samsung-870-evo-1tb-sata-25				f
432	WD Blue SN580 1TB NVMe M.2	WD Blue SN580 1TB NVMe M.2 — отличный выбор для сборки или апгрейда вашего ПК.	5800.00	t	f	f	wd-blue-sn580-1tb-nvme-m2				f
433	Seagate BarraCuda 4TB HDD 3.5"	Seagate BarraCuda 4TB HDD 3.5" — отличный выбор для сборки или апгрейда вашего ПК.	6900.00	t	f	f	seagate-barracuda-4tb-hdd-35				f
434	WD Red Plus 8TB NAS HDD 3.5"	WD Red Plus 8TB NAS HDD 3.5" — отличный выбор для сборки или апгрейда вашего ПК.	16800.00	t	t	f	wd-red-plus-8tb-nas-hdd-35				f
435	Toshiba N300 12TB NAS HDD 3.5"	Toshiba N300 12TB NAS HDD 3.5" — отличный выбор для сборки или апгрейда вашего ПК.	23400.00	t	f	f	toshiba-n300-12tb-nas-hdd-35				f
436	Seagate IronWolf 4TB NAS HDD 3.5"	Seagate IronWolf 4TB NAS HDD 3.5" — отличный выбор для сборки или апгрейда вашего ПК.	8600.00	t	f	f	seagate-ironwolf-4tb-nas-hdd-35				f
437	Corsair RM850x (2024) 850W 80+ Gold	Corsair RM850x (2024) 850W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	11200.00	t	f	f	corsair-rm850x-2024-850w-80plus-gold				f
438	be quiet! Dark Power 13 1000W 80+ Titanium	be quiet! Dark Power 13 1000W 80+ Titanium — отличный выбор для сборки или апгрейда вашего ПК.	22600.00	t	f	t	be-quiet-dark-power-13-1000w-80plus-titanium				f
439	Seasonic Focus GX-750 750W 80+ Gold	Seasonic Focus GX-750 750W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	8900.00	t	f	f	seasonic-focus-gx-750-750w-80plus-gold				f
440	Cooler Master MWE Gold 650 V2 650W 80+ Gold	Cooler Master MWE Gold 650 V2 650W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	6500.00	t	f	f	cooler-master-mwe-gold-650-v2-650w-80plus-gold				f
441	EVGA SuperNOVA 850 GT 850W 80+ Gold	EVGA SuperNOVA 850 GT 850W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	10300.00	t	f	f	evga-supernova-850-gt-850w-80plus-gold				f
442	Corsair RM750e 750W 80+ Gold	Corsair RM750e 750W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	8200.00	t	f	f	corsair-rm750e-750w-80plus-gold				f
443	DeepCool PQ1000M 1000W 80+ Gold	DeepCool PQ1000M 1000W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	12700.00	t	t	f	deepcool-pq1000m-1000w-80plus-gold				f
444	be quiet! Pure Power 12 M 750W 80+ Gold	be quiet! Pure Power 12 M 750W 80+ Gold — отличный выбор для сборки или апгрейда вашего ПК.	9600.00	t	f	f	be-quiet-pure-power-12-m-750w-80plus-gold				f
445	Cooler Master MasterBox TD500 Mesh V2	Cooler Master MasterBox TD500 Mesh V2 — отличный выбор для сборки или апгрейда вашего ПК.	8200.00	t	f	f	cooler-master-masterbox-td500-mesh-v2				f
446	Fractal Design North Charcoal Black	Fractal Design North Charcoal Black — отличный выбор для сборки или апгрейда вашего ПК.	12400.00	t	t	f	fractal-design-north-charcoal-black				f
447	NZXT H7 Flow	NZXT H7 Flow — отличный выбор для сборки или апгрейда вашего ПК.	10800.00	t	f	f	nzxt-h7-flow				f
448	Corsair 4000D Airflow	Corsair 4000D Airflow — отличный выбор для сборки или апгрейда вашего ПК.	8200.00	t	f	f	corsair-4000d-airflow				f
449	Lian Li O11 Dynamic EVO	Lian Li O11 Dynamic EVO — отличный выбор для сборки или апгрейда вашего ПК.	14800.00	t	f	t	lian-li-o11-dynamic-evo				f
450	be quiet! Silent Base 802	be quiet! Silent Base 802 — отличный выбор для сборки или апгрейда вашего ПК.	13500.00	t	f	f	be-quiet-silent-base-802				f
451	Noctua NH-D15 chromax.black	Noctua NH-D15 chromax.black — отличный выбор для сборки или апгрейда вашего ПК.	9200.00	t	f	t	noctua-nh-d15-chromax-black				f
452	DeepCool AK620	DeepCool AK620 — отличный выбор для сборки или апгрейда вашего ПК.	5400.00	t	f	f	deepcool-ak620				f
453	be quiet! Dark Rock Pro 4	be quiet! Dark Rock Pro 4 — отличный выбор для сборки или апгрейда вашего ПК.	7800.00	t	f	f	be-quiet-dark-rock-pro-4				f
454	Arctic Liquid Freezer II 360	Arctic Liquid Freezer II 360 — отличный выбор для сборки или апгрейда вашего ПК.	9600.00	t	f	f	arctic-liquid-freezer-ii-360				f
455	Corsair iCUE H150i Elite LCD XT	Corsair iCUE H150i Elite LCD XT — отличный выбор для сборки или апгрейда вашего ПК.	18200.00	t	f	f	corsair-icue-h150i-elite-lcd-xt				f
456	Cooler Master Hyper 212 Halo Black	Cooler Master Hyper 212 Halo Black — отличный выбор для сборки или апгрейда вашего ПК.	3200.00	t	f	f	cooler-master-hyper-212-halo-black				f
457	NZXT Kraken X63 RGB 280mm	NZXT Kraken X63 RGB 280mm — отличный выбор для сборки или апгрейда вашего ПК.	14200.00	t	f	f	nzxt-kraken-x63-rgb-280mm				f
458	Thermalright Peerless Assassin 120 SE	Thermalright Peerless Assassin 120 SE — отличный выбор для сборки или апгрейда вашего ПК.	3800.00	t	f	f	thermalright-peerless-assassin-120-se				f
459	Samsung Odyssey G7 27" QHD 240Hz Curved	Samsung Odyssey G7 27" QHD 240Hz Curved — отличный выбор для сборки или апгрейда вашего ПК.	43200.00	t	f	f	samsung-odyssey-g7-27-qhd-240hz-curved				f
460	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS — отличный выбор для сборки или апгрейда вашего ПК.	34600.00	t	f	f	lg-ultragear-27gp850-b-27-qhd-165hz-nano-ips				f
461	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED — отличный выбор для сборки или апгрейда вашего ПК.	112000.00	t	f	t	asus-rog-swift-pg32ucdm-32-4k-240hz-oled				f
462	Dell S2722QC 27" 4K 60Hz IPS	Dell S2722QC 27" 4K 60Hz IPS — отличный выбор для сборки или апгрейда вашего ПК.	28600.00	t	f	f	dell-s2722qc-27-4k-60hz-ips				f
463	Gigabyte M27Q 27" QHD 170Hz IPS	Gigabyte M27Q 27" QHD 170Hz IPS — отличный выбор для сборки или апгрейда вашего ПК.	26800.00	t	f	f	gigabyte-m27q-27-qhd-170hz-ips				f
464	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor — отличный выбор для сборки или апгрейда вашего ПК.	38400.00	t	f	f	benq-pd2705u-27-4k-60hz-ips-designer				f
465	ASUS ProArt PA278QV 27" QHD 75Hz IPS	ASUS ProArt PA278QV 27" QHD 75Hz IPS — отличный выбор для сборки или апгрейда вашего ПК.	26400.00	t	f	f	asus-proart-pa278qv-27-qhd-75hz-ips				f
466	LG 27GN950-B 27" 4K 144Hz Nano IPS	LG 27GN950-B 27" 4K 144Hz Nano IPS — отличный выбор для сборки или апгрейда вашего ПК.	62400.00	t	t	f	lg-27gn950-b-27-4k-144hz-nano-ips				f
467	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070 — отличный выбор для сборки или апгрейда вашего ПК.	154000.00	t	f	t	asus-rog-zephyrus-g16-2025-ultra9-rtx4070				f
468	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060 — отличный выбор для сборки или апгрейда вашего ПК.	132000.00	t	f	f	lenovo-legion-pro-5-16irx9-i9-rtx4060				f
469	Acer Predator Helios 16 16" i7 / RTX 4070	Acer Predator Helios 16 16" i7 / RTX 4070 — отличный выбор для сборки или апгрейда вашего ПК.	126000.00	t	t	f	acer-predator-helios-16-i7-rtx4070				f
470	Apple MacBook Pro 16" M4 Pro	Apple MacBook Pro 16" M4 Pro — отличный выбор для сборки или апгрейда вашего ПК.	224000.00	t	f	t	apple-macbook-pro-16-m4-pro				f
471	Apple MacBook Air 15" M4	Apple MacBook Air 15" M4 — отличный выбор для сборки или апгрейда вашего ПК.	118000.00	t	t	f	apple-macbook-air-15-m4				f
472	Dell XPS 15 9530 15.6" i7 / RTX 4060	Dell XPS 15 9530 15.6" i7 / RTX 4060 — отличный выбор для сборки или апгрейда вашего ПК.	148000.00	t	f	f	dell-xps-15-9530-i7-rtx4060				f
473	HP Spectre x360 16" Ultra 7 / Intel Arc	HP Spectre x360 16" Ultra 7 / Intel Arc — отличный выбор для сборки или апгрейда вашего ПК.	132000.00	t	f	f	hp-spectre-x360-16-ultra7-intel-arc				f
474	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7 — отличный выбор для сборки или апгрейда вашего ПК.	168000.00	t	f	f	lenovo-thinkpad-x1-carbon-gen12-ultra7				f
475	Logitech G Pro X Superlight 2	Logitech G Pro X Superlight 2 — отличный выбор для сборки или апгрейда вашего ПК.	12400.00	t	f	t	logitech-g-pro-x-superlight-2				f
476	Razer DeathAdder V3 Pro	Razer DeathAdder V3 Pro — отличный выбор для сборки или апгрейда вашего ПК.	13100.00	t	f	f	razer-deathadder-v3-pro				f
477	Logitech G502 X Plus	Logitech G502 X Plus — отличный выбор для сборки или апгрейда вашего ПК.	11600.00	t	f	f	logitech-g502-x-plus				f
478	Razer Basilisk V3 Pro	Razer Basilisk V3 Pro — отличный выбор для сборки или апгрейда вашего ПК.	14800.00	t	f	f	razer-basilisk-v3-pro				f
479	SteelSeries Rival 5	SteelSeries Rival 5 — отличный выбор для сборки или апгрейда вашего ПК.	5400.00	t	f	f	steelseries-rival-5				f
480	Zowie EC2-C	Zowie EC2-C — отличный выбор для сборки или апгрейда вашего ПК.	6800.00	t	f	f	zowie-ec2-c				f
481	SteelSeries Apex Pro TKL (2025) Wireless	SteelSeries Apex Pro TKL (2025) Wireless — отличный выбор для сборки или апгрейда вашего ПК.	18900.00	t	f	f	steelseries-apex-pro-tkl-2025-wireless				f
482	Razer BlackWidow V4 Pro	Razer BlackWidow V4 Pro — отличный выбор для сборки или апгрейда вашего ПК.	17400.00	t	f	f	razer-blackwidow-v4-pro				f
483	Logitech G915 TKL Wireless	Logitech G915 TKL Wireless — отличный выбор для сборки или апгрейда вашего ПК.	16800.00	t	f	f	logitech-g915-tkl-wireless				f
484	Keychron Q1 Pro QMK/VIA Wireless	Keychron Q1 Pro QMK/VIA Wireless — отличный выбор для сборки или апгрейда вашего ПК.	14200.00	t	t	f	keychron-q1-pro-qmk-via-wireless				f
485	Ducky One 3 Classic TKL	Ducky One 3 Classic TKL — отличный выбор для сборки или апгрейда вашего ПК.	9600.00	t	f	f	ducky-one-3-classic-tkl				f
486	Corsair K70 RGB Pro	Corsair K70 RGB Pro — отличный выбор для сборки или апгрейда вашего ПК.	12800.00	t	f	f	corsair-k70-rgb-pro				f
487	HyperX Cloud III Wireless	HyperX Cloud III Wireless — отличный выбор для сборки или апгрейда вашего ПК.	13200.00	t	f	f	hyperx-cloud-iii-wireless				f
488	SteelSeries Arctis Nova Pro Wireless	SteelSeries Arctis Nova Pro Wireless — отличный выбор для сборки или апгрейда вашего ПК.	28600.00	t	f	t	steelseries-arctis-nova-pro-wireless				f
489	Razer BlackShark V2 Pro (2024)	Razer BlackShark V2 Pro (2024) — отличный выбор для сборки или апгрейда вашего ПК.	16800.00	t	t	f	razer-blackshark-v2-pro-2024				f
490	Logitech G Pro X 2 Lightspeed	Logitech G Pro X 2 Lightspeed — отличный выбор для сборки или апгрейда вашего ПК.	19600.00	t	f	f	logitech-g-pro-x-2-lightspeed				f
\.


--
-- Data for Name: products_product_brands; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_product_brands (id, product_id, brand_id) FROM stdin;
429	395	320
430	396	320
431	397	320
432	398	320
433	399	321
434	400	321
435	401	321
436	402	321
437	403	322
438	403	323
439	404	322
440	404	324
441	405	322
442	405	325
443	406	322
444	406	323
445	407	321
446	407	325
447	408	321
448	408	325
449	409	321
450	409	323
451	410	320
452	410	323
453	411	323
454	412	325
455	413	323
456	414	324
457	415	349
458	416	324
459	417	325
460	418	323
461	419	332
462	420	331
463	421	347
464	422	348
465	423	348
466	424	354
467	425	355
468	426	332
469	427	326
470	428	334
471	429	332
472	430	348
473	431	326
474	432	334
475	433	333
476	434	334
477	435	356
478	436	333
479	437	331
480	438	339
481	439	340
482	440	338
483	441	350
484	442	331
485	443	345
486	444	339
487	445	338
488	446	351
489	447	352
490	448	331
491	449	353
492	450	339
493	451	344
494	452	345
495	453	339
496	454	346
497	455	331
498	456	338
499	457	352
500	458	361
501	459	326
502	460	327
503	461	323
504	462	328
505	463	325
506	464	343
507	465	323
508	466	327
509	467	323
510	468	330
511	469	337
512	470	360
513	471	360
514	472	328
515	473	329
516	474	330
517	475	335
518	476	336
519	477	335
520	478	336
521	479	342
522	480	359
523	481	342
524	482	336
525	483	335
526	484	357
527	485	358
528	486	331
529	487	341
530	488	342
531	489	336
532	490	335
\.


--
-- Data for Name: products_product_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_product_categories (id, product_id, category_id) FROM stdin;
395	395	200
396	396	200
397	397	200
398	398	200
399	399	200
400	400	200
401	401	200
402	402	200
403	403	201
404	404	201
405	405	201
406	406	201
407	407	201
408	408	201
409	409	201
410	410	201
411	411	202
412	412	202
413	413	202
414	414	202
415	415	202
416	416	202
417	417	202
418	418	202
419	419	203
420	420	203
421	421	203
422	422	203
423	423	203
424	424	203
425	425	203
426	426	203
427	427	204
428	428	204
429	429	204
430	430	204
431	431	204
432	432	204
433	433	205
434	434	205
435	435	205
436	436	205
437	437	206
438	438	206
439	439	206
440	440	206
441	441	206
442	442	206
443	443	206
444	444	206
445	445	207
446	446	207
447	447	207
448	448	207
449	449	207
450	450	207
451	451	208
452	452	208
453	453	208
454	454	208
455	455	208
456	456	208
457	457	208
458	458	208
459	459	217
460	460	217
461	461	217
462	462	219
463	463	217
464	464	218
465	465	218
466	466	217
467	467	213
468	468	213
469	469	213
470	470	215
471	471	214
472	472	215
473	473	214
474	474	215
475	475	222
476	476	222
477	477	222
478	478	222
479	479	222
480	480	222
481	481	221
482	482	221
483	483	221
484	484	221
485	485	221
486	486	221
487	487	223
488	488	223
489	489	223
490	490	223
\.


--
-- Data for Name: products_product_feature_tags; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_product_feature_tags (id, product_id, tag_id) FROM stdin;
1482	395	658
1483	395	659
1484	395	660
1485	395	661
1486	396	659
1487	396	660
1488	396	661
1489	397	662
1490	397	659
1491	397	660
1492	397	661
1493	398	663
1494	398	664
1495	398	660
1496	399	658
1497	399	659
1498	399	665
1499	399	666
1500	400	659
1501	400	665
1502	400	666
1503	401	662
1504	401	659
1505	401	666
1506	402	658
1507	402	667
1508	402	668
1509	402	661
1510	403	658
1511	403	659
1512	403	669
1513	403	670
1514	403	671
1515	404	659
1516	404	669
1517	404	670
1518	404	671
1519	405	659
1520	405	669
1521	405	670
1522	405	672
1523	406	662
1524	406	659
1525	406	669
1526	406	670
1527	406	673
1528	407	658
1529	407	659
1530	407	674
1531	407	671
1532	408	659
1533	408	674
1534	408	672
1535	409	662
1536	409	659
1537	409	674
1538	409	673
1539	410	662
1540	410	659
1541	410	675
1542	410	676
1543	411	659
1544	411	677
1545	411	678
1546	411	679
1547	412	659
1548	412	677
1549	412	678
1550	412	679
1551	413	662
1552	413	677
1553	413	678
1554	413	679
1555	414	659
1556	414	677
1557	414	680
1558	414	679
1559	415	662
1560	415	677
1561	415	680
1562	415	681
1563	416	658
1564	416	677
1565	416	680
1566	416	679
1567	417	662
1568	417	682
1569	417	683
1570	417	679
1571	418	658
1572	418	677
1573	418	680
1574	418	684
1575	419	677
1576	419	685
1577	419	686
1578	420	677
1579	420	687
1580	420	688
1581	420	686
1582	421	677
1583	421	689
1584	421	688
1585	421	686
1586	421	684
1587	422	677
1588	422	685
1589	422	686
1590	423	682
1591	423	690
1592	423	686
1593	423	663
1594	424	677
1595	424	687
1596	424	688
1597	424	691
1598	424	686
1599	425	682
1600	425	692
1601	425	663
1602	425	686
1603	426	677
1604	426	693
1605	426	684
1606	426	686
1607	427	694
1608	427	695
1609	427	696
1610	428	694
1611	428	695
1612	428	659
1613	429	694
1614	429	695
1615	429	696
1616	430	694
1617	430	697
1618	430	696
1619	430	698
1620	431	699
1621	431	700
1622	431	701
1623	431	663
1624	432	694
1625	432	695
1626	432	663
1627	432	664
1628	433	702
1629	433	703
1630	433	704
1631	434	702
1632	434	705
1633	434	706
1634	434	707
1635	435	702
1636	435	705
1637	435	706
1638	435	708
1639	436	702
1640	436	705
1641	436	709
1642	436	707
1643	437	710
1644	437	711
1645	437	712
1646	438	713
1647	438	710
1648	438	714
1649	438	715
1650	439	710
1651	439	716
1652	439	712
1653	439	717
1654	440	663
1655	440	718
1656	440	712
1657	440	719
1658	441	710
1659	441	711
1660	441	712
1661	442	710
1662	442	716
1663	442	712
1664	442	720
1665	443	710
1666	443	714
1667	443	712
1668	443	721
1669	444	713
1670	444	722
1671	444	716
1672	444	712
1673	444	721
1674	445	723
1675	445	724
1676	445	688
1677	445	725
1678	446	723
1679	446	726
1680	446	724
1681	446	727
1682	447	723
1683	447	728
1684	447	729
1685	447	725
1686	448	723
1687	448	728
1688	448	663
1689	448	725
1690	449	723
1691	449	730
1692	449	725
1693	449	731
1694	450	723
1695	450	732
1696	450	733
1697	450	710
1698	451	734
1699	451	735
1700	451	736
1701	451	713
1702	451	696
1703	452	734
1704	452	735
1705	452	737
1706	452	663
1707	453	734
1708	453	735
1709	453	737
1710	453	713
1711	454	738
1712	454	739
1713	454	713
1714	454	731
1715	455	738
1716	455	739
1717	455	688
1718	455	740
1719	455	696
1720	456	734
1721	456	741
1722	456	737
1723	456	663
1724	456	688
1725	457	738
1726	457	742
1727	457	688
1728	457	743
1729	458	734
1730	458	735
1731	458	737
1732	458	663
1733	458	744
1734	459	659
1735	459	745
1736	459	746
1737	459	747
1738	459	748
1739	460	659
1740	460	749
1741	460	750
1742	460	746
1743	460	751
1744	461	659
1745	461	752
1746	461	671
1747	461	745
1748	461	658
1749	462	753
1750	462	671
1751	462	754
1752	462	755
1753	462	667
1754	463	659
1755	463	756
1756	463	754
1757	463	746
1758	463	757
1759	464	758
1760	464	671
1761	464	754
1762	464	759
1763	464	755
1764	465	758
1765	465	746
1766	465	754
1767	465	759
1768	465	663
1769	466	659
1770	466	671
1771	466	760
1772	466	750
1773	466	761
1774	467	659
1775	467	762
1776	467	763
1777	467	745
1778	467	752
1779	468	659
1780	468	764
1781	468	765
1782	468	749
1783	469	659
1784	469	762
1785	469	766
1786	469	745
1787	469	767
1788	470	768
1789	470	769
1790	470	770
1791	470	771
1792	471	772
1793	471	773
1794	471	774
1795	471	775
1796	471	771
1797	472	772
1798	472	776
1799	472	752
1800	472	667
1801	473	772
1802	473	777
1803	473	752
1804	473	778
1805	473	776
1806	474	779
1807	474	775
1808	474	780
1809	474	781
1810	475	782
1811	475	783
1812	475	784
1813	475	785
1814	475	786
1815	476	782
1816	476	787
1817	476	788
1818	476	789
1819	477	782
1820	477	688
1821	477	790
1822	477	791
1823	478	782
1824	478	688
1825	478	788
1826	478	792
1827	479	793
1828	479	688
1829	479	794
1830	479	791
1831	479	663
1832	480	793
1833	480	785
1834	480	786
1835	480	795
1836	480	789
1837	481	782
1838	481	796
1839	481	688
1840	481	797
1841	481	798
1842	482	793
1843	482	688
1844	482	799
1845	482	800
1846	482	801
1847	483	782
1848	483	802
1849	483	688
1850	483	797
1851	483	803
1852	484	782
1853	484	688
1854	484	804
1855	484	805
1856	484	806
1857	484	807
1858	485	793
1859	485	688
1860	485	797
1861	485	808
1862	485	809
1863	486	793
1864	486	688
1865	486	799
1866	486	809
1867	486	810
1868	487	782
1869	487	811
1870	487	812
1871	488	782
1872	488	813
1873	488	814
1874	488	658
1875	488	815
1876	489	782
1877	489	816
1878	489	785
1879	489	786
1880	490	782
1881	490	817
1882	490	785
1883	490	786
1884	490	818
\.


--
-- Data for Name: products_productattribute; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productattribute (id, attribute_id, product_id, value_bool, value_enum, value_int, value_str, variant_id) FROM stdin;
1363	265	395	\N		3	3.2	\N
1364	266	395	\N		6	6.0	\N
1365	267	395	\N		24	24	\N
1366	268	395	\N		32	32	\N
1367	269	395	\N	LGA1700	\N	LGA1700	\N
1368	271	395	\N		253	253	\N
1369	265	396	\N		3	3.4	\N
1370	266	396	\N		5	5.6	\N
1371	267	396	\N		20	20	\N
1372	268	396	\N		28	28	\N
1373	269	396	\N	LGA1700	\N	LGA1700	\N
1374	271	396	\N		253	253	\N
1375	265	397	\N		3	3.5	\N
1376	266	397	\N		5	5.3	\N
1377	267	397	\N		14	14	\N
1378	268	397	\N		20	20	\N
1379	269	397	\N	LGA1700	\N	LGA1700	\N
1380	271	397	\N		181	181	\N
1381	265	398	\N		3	3.5	\N
1382	266	398	\N		4	4.7	\N
1383	267	398	\N		4	4	\N
1384	268	398	\N		8	8	\N
1385	269	398	\N	LGA1700	\N	LGA1700	\N
1386	271	398	\N		110	110	\N
1387	265	399	\N		4	4.2	\N
1388	266	399	\N		5	5.7	\N
1389	267	399	\N		16	16	\N
1390	268	399	\N		32	32	\N
1391	269	399	\N	AM5	\N	AM5	\N
1392	271	399	\N		120	120	\N
1393	265	400	\N		4	4.2	\N
1394	266	400	\N		5	5.0	\N
1395	267	400	\N		8	8	\N
1396	268	400	\N		16	16	\N
1397	269	400	\N	AM5	\N	AM5	\N
1398	271	400	\N		120	120	\N
1399	265	401	\N		4	4.7	\N
1400	266	401	\N		5	5.3	\N
1401	267	401	\N		6	6	\N
1402	268	401	\N		12	12	\N
1403	269	401	\N	AM5	\N	AM5	\N
1404	271	401	\N		105	105	\N
1405	265	402	\N		4	4.3	\N
1406	266	402	\N		5	5.7	\N
1407	267	402	\N		16	16	\N
1408	268	402	\N		32	32	\N
1409	269	402	\N	AM5	\N	AM5	\N
1410	271	402	\N		170	170	\N
1411	272	403	\N		24	24	\N
1412	273	403	\N	GDDR6X	\N	GDDR6X	\N
1413	274	403	\N		384	384	\N
1414	272	404	\N		16	16	\N
1415	273	404	\N	GDDR6X	\N	GDDR6X	\N
1416	274	404	\N		256	256	\N
1417	272	405	\N		12	12	\N
1418	273	405	\N	GDDR6X	\N	GDDR6X	\N
1419	274	405	\N		192	192	\N
1420	272	406	\N		8	8	\N
1421	273	406	\N	GDDR6	\N	GDDR6	\N
1422	274	406	\N		128	128	\N
1423	272	407	\N		24	24	\N
1424	273	407	\N	GDDR6	\N	GDDR6	\N
1425	274	407	\N		384	384	\N
1426	272	408	\N		16	16	\N
1427	273	408	\N	GDDR6	\N	GDDR6	\N
1428	274	408	\N		256	256	\N
1429	272	409	\N		8	8	\N
1430	273	409	\N	GDDR6	\N	GDDR6	\N
1431	274	409	\N		128	128	\N
1432	272	410	\N		16	16	\N
1433	273	410	\N	GDDR6	\N	GDDR6	\N
1434	274	410	\N		256	256	\N
1435	269	411	\N	LGA1700	\N	LGA1700	\N
1436	276	411	\N	DDR5	\N	DDR5	\N
1437	281	411	\N	ATX	\N	ATX	\N
1438	269	412	\N	LGA1700	\N	LGA1700	\N
1439	276	412	\N	DDR5	\N	DDR5	\N
1440	281	412	\N	ATX	\N	ATX	\N
1441	269	413	\N	LGA1700	\N	LGA1700	\N
1442	276	413	\N	DDR5	\N	DDR5	\N
1443	281	413	\N	ATX	\N	ATX	\N
1444	269	414	\N	AM5	\N	AM5	\N
1445	276	414	\N	DDR5	\N	DDR5	\N
1446	281	414	\N	ATX	\N	ATX	\N
1447	269	415	\N	AM5	\N	AM5	\N
1448	276	415	\N	DDR5	\N	DDR5	\N
1449	281	415	\N	microATX	\N	microATX	\N
1450	269	416	\N	AM5	\N	AM5	\N
1451	276	416	\N	DDR5	\N	DDR5	\N
1452	281	416	\N	ATX	\N	ATX	\N
1453	269	417	\N	AM4	\N	AM4	\N
1454	276	417	\N	DDR4	\N	DDR4	\N
1455	281	417	\N	ATX	\N	ATX	\N
1456	269	418	\N	AM5	\N	AM5	\N
1457	276	418	\N	DDR5	\N	DDR5	\N
1458	281	418	\N	ATX	\N	ATX	\N
1459	275	419	\N		32	32	\N
1460	276	419	\N	DDR5	\N	DDR5	\N
1461	277	419	\N		5600	5600	\N
1462	278	419	\N		2	2	\N
1463	275	420	\N		32	32	\N
1464	276	420	\N	DDR5	\N	DDR5	\N
1465	277	420	\N		6000	6000	\N
1466	278	420	\N		2	2	\N
1467	275	421	\N		32	32	\N
1468	276	421	\N	DDR5	\N	DDR5	\N
1469	277	421	\N		6400	6400	\N
1470	278	421	\N		2	2	\N
1471	275	422	\N		32	32	\N
1472	276	422	\N	DDR5	\N	DDR5	\N
1473	277	422	\N		5600	5600	\N
1474	278	422	\N		2	2	\N
1475	275	423	\N		32	32	\N
1476	276	423	\N	DDR4	\N	DDR4	\N
1477	277	423	\N		3200	3200	\N
1478	278	423	\N		2	2	\N
1479	275	424	\N		64	64	\N
1480	276	424	\N	DDR5	\N	DDR5	\N
1481	277	424	\N		6000	6000	\N
1482	278	424	\N		2	2	\N
1483	275	425	\N		16	16	\N
1484	276	425	\N	DDR4	\N	DDR4	\N
1485	277	425	\N		3600	3600	\N
1486	278	425	\N		2	2	\N
1487	275	426	\N		32	32	\N
1488	276	426	\N	DDR5	\N	DDR5	\N
1489	277	426	\N		7200	7200	\N
1490	278	426	\N		2	2	\N
1491	279	427	\N		2000	2000	\N
1492	280	427	\N	NVMe	\N	NVMe	\N
1493	281	427	\N	M.2 2280	\N	M.2 2280	\N
1494	282	427	\N		7450	7450	\N
1495	283	427	\N		6900	6900	\N
1496	279	428	\N		1000	1000	\N
1497	280	428	\N	NVMe	\N	NVMe	\N
1498	281	428	\N	M.2 2280	\N	M.2 2280	\N
1499	282	428	\N		7300	7300	\N
1500	283	428	\N		6300	6300	\N
1501	279	429	\N		2000	2000	\N
1502	280	429	\N	NVMe	\N	NVMe	\N
1503	281	429	\N	M.2 2280	\N	M.2 2280	\N
1504	282	429	\N		7000	7000	\N
1505	283	429	\N		7000	7000	\N
1506	279	430	\N		1000	1000	\N
1507	280	430	\N	NVMe	\N	NVMe	\N
1508	281	430	\N	M.2 2280	\N	M.2 2280	\N
1509	282	430	\N		11700	11700	\N
1510	283	430	\N		9500	9500	\N
1511	279	431	\N		1000	1000	\N
1512	280	431	\N	SSD	\N	SSD	\N
1513	281	431	\N	2.5"	\N	2.5"	\N
1514	282	431	\N		560	560	\N
1515	283	431	\N		530	530	\N
1516	279	432	\N		1000	1000	\N
1517	280	432	\N	NVMe	\N	NVMe	\N
1518	281	432	\N	M.2 2280	\N	M.2 2280	\N
1519	282	432	\N		4150	4150	\N
1520	283	432	\N		4150	4150	\N
1521	279	433	\N		4000	4000	\N
1522	280	433	\N	HDD	\N	HDD	\N
1523	281	433	\N	3.5"	\N	3.5"	\N
1524	279	434	\N		8000	8000	\N
1525	280	434	\N	HDD	\N	HDD	\N
1526	281	434	\N	3.5"	\N	3.5"	\N
1527	279	435	\N		12000	12000	\N
1528	280	435	\N	HDD	\N	HDD	\N
1529	281	435	\N	3.5"	\N	3.5"	\N
1530	279	436	\N		4000	4000	\N
1531	280	436	\N	HDD	\N	HDD	\N
1532	281	436	\N	3.5"	\N	3.5"	\N
1533	284	437	\N		850	850	\N
1534	285	437	\N	80+ Gold	\N	80+ Gold	\N
1535	286	437	\N	Fully modular	\N	Fully modular	\N
1536	284	438	\N		1000	1000	\N
1537	285	438	\N	80+ Titanium	\N	80+ Titanium	\N
1538	286	438	\N	Fully modular	\N	Fully modular	\N
1539	284	439	\N		750	750	\N
1548	284	442	\N		750	750	\N
1549	285	442	\N	80+ Gold	\N	80+ Gold	\N
1550	286	442	\N	Fully modular	\N	Fully modular	\N
1551	284	443	\N		1000	1000	\N
1552	285	443	\N	80+ Gold	\N	80+ Gold	\N
1553	286	443	\N	Fully modular	\N	Fully modular	\N
1554	284	444	\N		750	750	\N
1555	285	444	\N	80+ Gold	\N	80+ Gold	\N
1556	286	444	\N	Semi-modular	\N	Semi-modular	\N
1557	301	445	t		\N	Да	\N
1558	300	445	\N		\N	Black	\N
1559	301	446	f		\N	Нет	\N
1560	300	446	\N		\N	Charcoal Black	\N
1540	285	439	\N	80+ Gold	\N	80+ Gold	\N
1541	286	439	\N	Fully modular	\N	Fully modular	\N
1561	301	447	f		\N	Нет	\N
1542	284	440	\N		650	650	\N
1543	285	440	\N	80+ Gold	\N	80+ Gold	\N
1544	286	440	\N	Non-modular	\N	Non-modular	\N
1545	284	441	\N		850	850	\N
1546	285	441	\N	80+ Gold	\N	80+ Gold	\N
1547	286	441	\N	Fully modular	\N	Fully modular	\N
1562	300	447	\N		\N	White	\N
1563	301	448	f		\N	Нет	\N
1564	300	448	\N		\N	Black	\N
1565	301	449	f		\N	Нет	\N
1566	300	449	\N		\N	White	\N
1567	301	450	f		\N	Нет	\N
1568	300	450	\N		\N	Black	\N
1569	300	451	\N		\N	Black	\N
1570	300	452	\N		\N	Black	\N
1571	300	453	\N		\N	Black	\N
1572	300	454	\N		\N	Black	\N
1573	301	455	t		\N	Да	\N
1574	300	455	\N		\N	Black	\N
1575	301	456	t		\N	Да	\N
1576	300	456	\N		\N	Black	\N
1577	301	457	t		\N	Да	\N
1578	300	457	\N		\N	Black	\N
1579	300	458	\N		\N	Silver	\N
1580	287	459	\N		\N	27"	\N
1581	288	459	\N		\N	2560×1440 (QHD)	\N
1582	289	459	\N	VA	\N	VA	\N
1583	290	459	\N		240	240	\N
1603	289	462	\N	IPS	\N	IPS	\N
1604	290	462	\N		60	60	\N
1584	291	459	\N		1	1	\N
1585	292	459	t		\N	Да	\N
1605	291	462	\N		4	4	\N
1586	293	459	\N		350	350	\N
1587	287	460	\N		\N	27"	\N
1606	292	462	f		\N	Нет	\N
1607	293	462	\N		350	350	\N
1588	288	460	\N		\N	2560×1440 (QHD)	\N
1589	289	460	\N	Nano IPS	\N	Nano IPS	\N
1608	287	463	\N		\N	27"	\N
1590	290	460	\N		165	165	\N
1591	291	460	\N		1	1	\N
1609	288	463	\N		\N	2560×1440 (QHD)	\N
1610	289	463	\N	IPS	\N	IPS	\N
1592	292	460	f		\N	Нет	\N
1593	293	460	\N		400	400	\N
1611	290	463	\N		170	170	\N
1594	287	461	\N		\N	32"	\N
1595	288	461	\N		\N	3840×2160 (4K)	\N
1612	291	463	\N		1	1	\N
1613	292	463	f		\N	Нет	\N
1596	289	461	\N	OLED	\N	OLED	\N
1614	293	463	\N		350	350	\N
1615	287	464	\N		\N	27"	\N
1597	290	461	\N		240	240	\N
1598	291	461	\N		0	0.03	\N
1599	292	461	f		\N	Нет	\N
1600	293	461	\N		1000	1000	\N
1601	287	462	\N		\N	27"	\N
1602	288	462	\N		\N	3840×2160 (4K)	\N
1616	288	464	\N		\N	3840×2160 (4K)	\N
1617	289	464	\N	IPS	\N	IPS	\N
1618	290	464	\N		60	60	\N
1619	291	464	\N		5	5	\N
1620	292	464	f		\N	Нет	\N
1621	293	464	\N		350	350	\N
1622	287	465	\N		\N	27"	\N
1623	288	465	\N		\N	2560×1440 (QHD)	\N
1624	289	465	\N	IPS	\N	IPS	\N
1625	290	465	\N		75	75	\N
1626	291	465	\N		5	5	\N
1627	292	465	f		\N	Нет	\N
1628	293	465	\N		350	350	\N
1629	287	466	\N		\N	27"	\N
1630	288	466	\N		\N	3840×2160 (4K)	\N
1631	289	466	\N	Nano IPS	\N	Nano IPS	\N
1632	290	466	\N		144	144	\N
1633	291	466	\N		1	1	\N
1634	292	466	f		\N	Нет	\N
1635	293	466	\N		600	600	\N
1636	294	467	\N		\N	16"	\N
1637	295	467	\N		\N	Intel Core Ultra 9 285H	\N
1658	296	471	\N		\N	Integrated 10-core	\N
1659	297	471	\N		16	16	\N
1638	296	467	\N		\N	NVIDIA RTX 4070 8GB	\N
1660	298	471	\N		256	256	\N
1639	297	467	\N		32	32	\N
1661	294	472	\N		\N	15.6"	\N
1662	295	472	\N		\N	Intel Core i7-13700H	\N
1640	298	467	\N		1000	1000	\N
1663	296	472	\N		\N	NVIDIA RTX 4060 6GB	\N
1641	294	468	\N		\N	16"	\N
1664	297	472	\N		16	16	\N
1665	298	472	\N		512	512	\N
1642	295	468	\N		\N	Intel Core i9-14900HX	\N
1666	294	473	\N		\N	16"	\N
1643	296	468	\N		\N	NVIDIA RTX 4060 8GB	\N
1667	295	473	\N		\N	Intel Core Ultra 7 155H	\N
1668	296	473	\N		\N	Intel Arc Integrated	\N
1669	297	473	\N		16	16	\N
1670	298	473	\N		1000	1000	\N
1671	294	474	\N		\N	14"	\N
1672	295	474	\N		\N	Intel Core Ultra 7 155H	\N
1673	296	474	\N		\N	Intel Arc Integrated	\N
1674	297	474	\N		32	32	\N
1675	298	474	\N		1000	1000	\N
1676	299	474	\N		\N	1.09 kg	\N
1677	302	475	t		\N	Да	\N
1678	300	475	\N		\N	Black	\N
1679	302	476	t		\N	Да	\N
1680	300	476	\N		\N	Black	\N
1644	297	468	\N		16	16	\N
1645	298	468	\N		1000	1000	\N
1646	294	469	\N		\N	16"	\N
1647	295	469	\N		\N	Intel Core i7-14700HX	\N
1648	296	469	\N		\N	NVIDIA RTX 4070 8GB	\N
1649	297	469	\N		16	16	\N
1650	298	469	\N		1000	1000	\N
1651	294	470	\N		\N	16.2"	\N
1652	295	470	\N		\N	Apple M4 Pro	\N
1653	296	470	\N		\N	Integrated 20-core	\N
1654	297	470	\N		24	24	\N
1655	298	470	\N		512	512	\N
1656	294	471	\N		\N	15.3"	\N
1657	295	471	\N		\N	Apple M4	\N
1681	302	477	t		\N	Да	\N
1682	301	477	t		\N	Да	\N
1683	300	477	\N		\N	Black	\N
1684	302	478	t		\N	Да	\N
1685	301	478	t		\N	Да	\N
1686	300	478	\N		\N	Black	\N
1687	302	479	f		\N	Нет	\N
1688	301	479	t		\N	Да	\N
1689	300	479	\N		\N	Black	\N
1690	302	480	f		\N	Нет	\N
1691	301	480	f		\N	Нет	\N
1692	300	480	\N		\N	Black	\N
1693	303	481	t		\N	Да	\N
1694	301	481	t		\N	Да	\N
1695	302	481	t		\N	Да	\N
1696	303	482	t		\N	Да	\N
1697	301	482	t		\N	Да	\N
1698	302	482	f		\N	Нет	\N
1699	303	483	t		\N	Да	\N
1700	301	483	t		\N	Да	\N
1701	302	483	t		\N	Да	\N
1702	303	484	t		\N	Да	\N
1703	301	484	t		\N	Да	\N
1704	302	484	t		\N	Да	\N
1705	303	485	t		\N	Да	\N
1706	301	485	t		\N	Да	\N
1707	302	485	f		\N	Нет	\N
1708	303	486	t		\N	Да	\N
1709	301	486	t		\N	Да	\N
1710	302	486	f		\N	Нет	\N
1711	302	487	t		\N	Да	\N
1712	301	487	f		\N	Нет	\N
1713	302	488	t		\N	Да	\N
1714	301	488	f		\N	Нет	\N
1715	302	489	t		\N	Да	\N
1716	301	489	f		\N	Нет	\N
1717	302	490	t		\N	Да	\N
1718	301	490	f		\N	Нет	\N
\.


--
-- Data for Name: products_productimage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productimage (id, image, is_main, product_id, alt_text, image_type, sort_order, variant_id, provenance) FROM stdin;
1396	product_images/intel-core-i9-14900k_0.jpg	t	395	Intel Core i9-14900K	main	0	\N	web
1397	product_images/intel-core-i9-14900k_1.webp	f	395	Intel Core i9-14900K	gallery	1	\N	web
1398	product_images/intel-core-i9-14900k_2.jpg	f	395	Intel Core i9-14900K	gallery	2	\N	web
1399	product_images/intel-core-i7-14700k_0.jpg	t	396	Intel Core i7-14700K	main	0	\N	web
1400	product_images/intel-core-i7-14700k_1.png	f	396	Intel Core i7-14700K	gallery	1	\N	web
1401	product_images/intel-core-i7-14700k_2.jpg	f	396	Intel Core i7-14700K	gallery	2	\N	web
1402	product_images/intel-core-i5-14600k_0.webp	t	397	Intel Core i5-14600K	main	0	\N	web
1403	product_images/intel-core-i5-14600k_1.png	f	397	Intel Core i5-14600K	gallery	1	\N	web
1404	product_images/intel-core-i5-14600k_4.jpg	f	397	Intel Core i5-14600K	gallery	4	\N	web
1405	product_images/intel-core-i3-14100f_0.jpg	t	398	Intel Core i3-14100F	main	0	\N	web
1406	product_images/intel-core-i3-14100f_1.jpg	f	398	Intel Core i3-14100F	gallery	1	\N	web
1407	product_images/intel-core-i3-14100f_2.jpg	f	398	Intel Core i3-14100F	gallery	2	\N	web
1408	product_images/amd-ryzen-9-7950x3d_0.jpg	t	399	AMD Ryzen 9 7950X3D	main	0	\N	web
1409	product_images/amd-ryzen-9-7950x3d_2.jpg	f	399	AMD Ryzen 9 7950X3D	gallery	2	\N	web
1410	product_images/amd-ryzen-9-7950x3d_3.jpg	f	399	AMD Ryzen 9 7950X3D	gallery	3	\N	web
1411	product_images/amd-ryzen-7-7800x3d_0.jpg	t	400	AMD Ryzen 7 7800X3D	main	0	\N	web
1412	product_images/amd-ryzen-7-7800x3d_1.jpg	f	400	AMD Ryzen 7 7800X3D	gallery	1	\N	web
1413	product_images/amd-ryzen-7-7800x3d_2.jpg	f	400	AMD Ryzen 7 7800X3D	gallery	2	\N	web
1414	product_images/amd-ryzen-5-7600x_0.jpg	t	401	AMD Ryzen 5 7600X	main	0	\N	web
1415	product_images/amd-ryzen-5-7600x_1.jpg	f	401	AMD Ryzen 5 7600X	gallery	1	\N	web
1416	product_images/amd-ryzen-5-7600x_2.jpg	f	401	AMD Ryzen 5 7600X	gallery	2	\N	web
1417	product_images/amd-ryzen-9-9950x_1.jpg	f	402	AMD Ryzen 9 9950X	gallery	1	\N	web
1418	product_images/amd-ryzen-9-9950x_2.jpg	f	402	AMD Ryzen 9 9950X	gallery	2	\N	web
1419	product_images/amd-ryzen-9-9950x_3.jpg	f	402	AMD Ryzen 9 9950X	gallery	3	\N	web
1420	product_images/nvidia-geforce-rtx-4090_0.png	t	403	NVIDIA GeForce RTX 4090	main	0	\N	web
1421	product_images/nvidia-geforce-rtx-4090_3.jpg	f	403	NVIDIA GeForce RTX 4090	gallery	3	\N	web
1422	product_images/nvidia-geforce-rtx-4090_5.jpg	f	403	NVIDIA GeForce RTX 4090	gallery	5	\N	web
1423	product_images/nvidia-geforce-rtx-4080-super_1.jpg	f	404	NVIDIA GeForce RTX 4080 Super	gallery	1	\N	web
1424	product_images/nvidia-geforce-rtx-4080-super_2.jpg	f	404	NVIDIA GeForce RTX 4080 Super	gallery	2	\N	web
1425	product_images/nvidia-geforce-rtx-4080-super_3.jpg	f	404	NVIDIA GeForce RTX 4080 Super	gallery	3	\N	web
1426	product_images/nvidia-geforce-rtx-4070-super_0.jpg	t	405	NVIDIA GeForce RTX 4070 Super	main	0	\N	web
1427	product_images/nvidia-geforce-rtx-4070-super_1.jpg	f	405	NVIDIA GeForce RTX 4070 Super	gallery	1	\N	web
1428	product_images/nvidia-geforce-rtx-4070-super_3.jpg	f	405	NVIDIA GeForce RTX 4070 Super	gallery	3	\N	web
1429	product_images/nvidia-geforce-rtx-4060-ti_1.jpg	f	406	NVIDIA GeForce RTX 4060 Ti	gallery	1	\N	web
1430	product_images/nvidia-geforce-rtx-4060-ti_2.png	f	406	NVIDIA GeForce RTX 4060 Ti	gallery	2	\N	web
1431	product_images/nvidia-geforce-rtx-4060-ti_3.jpg	f	406	NVIDIA GeForce RTX 4060 Ti	gallery	3	\N	web
1432	product_images/amd-radeon-rx-7900-xtx_0.jpg	t	407	AMD Radeon RX 7900 XTX	main	0	\N	web
1433	product_images/amd-radeon-rx-7900-xtx_1.webp	f	407	AMD Radeon RX 7900 XTX	gallery	1	\N	web
1434	product_images/amd-radeon-rx-7900-xtx_2.png	f	407	AMD Radeon RX 7900 XTX	gallery	2	\N	web
1435	product_images/amd-radeon-rx-7800-xt_0.jpg	t	408	AMD Radeon RX 7800 XT	main	0	\N	web
1436	product_images/amd-radeon-rx-7800-xt_1.jpg	f	408	AMD Radeon RX 7800 XT	gallery	1	\N	web
1437	product_images/amd-radeon-rx-7800-xt_2.jpg	f	408	AMD Radeon RX 7800 XT	gallery	2	\N	web
1438	product_images/amd-radeon-rx-7600_0.jpg	t	409	AMD Radeon RX 7600	main	0	\N	web
1439	product_images/amd-radeon-rx-7600_1.jpg	f	409	AMD Radeon RX 7600	gallery	1	\N	web
1440	product_images/amd-radeon-rx-7600_2.jpg	f	409	AMD Radeon RX 7600	gallery	2	\N	web
1441	product_images/intel-arc-a770-16gb_1.jpg	f	410	Intel Arc A770 16GB	gallery	1	\N	web
1442	product_images/intel-arc-a770-16gb_2.jpg	f	410	Intel Arc A770 16GB	gallery	2	\N	web
1443	product_images/intel-arc-a770-16gb_4.jpg	f	410	Intel Arc A770 16GB	gallery	4	\N	web
1444	product_images/asus-rog-strix-z790-f-gaming-wifi_1.jpg	f	411	ASUS ROG STRIX Z790-F Gaming WiFi	gallery	1	\N	web
1445	product_images/asus-rog-strix-z790-f-gaming-wifi_2.png	f	411	ASUS ROG STRIX Z790-F Gaming WiFi	gallery	2	\N	web
1446	product_images/asus-rog-strix-z790-f-gaming-wifi_3.jpg	f	411	ASUS ROG STRIX Z790-F Gaming WiFi	gallery	3	\N	web
1447	product_images/gigabyte-z790-aorus-elite-ax_0.png	t	412	Gigabyte Z790 AORUS Elite AX	main	0	\N	web
1448	product_images/gigabyte-z790-aorus-elite-ax_1.jpg	f	412	Gigabyte Z790 AORUS Elite AX	gallery	1	\N	web
1449	product_images/gigabyte-z790-aorus-elite-ax_2.png	f	412	Gigabyte Z790 AORUS Elite AX	gallery	2	\N	web
1450	product_images/asus-tuf-gaming-b760-plus-wifi_0.png	t	413	ASUS TUF Gaming B760-PLUS WiFi	main	0	\N	web
1451	product_images/asus-tuf-gaming-b760-plus-wifi_3.jpg	f	413	ASUS TUF Gaming B760-PLUS WiFi	gallery	3	\N	web
1452	product_images/asus-tuf-gaming-b760-plus-wifi_4.png	f	413	ASUS TUF Gaming B760-PLUS WiFi	gallery	4	\N	web
1453	product_images/msi-mag-b650-tomahawk-wifi_0.png	t	414	MSI MAG B650 TOMAHAWK WiFi	main	0	\N	web
1454	product_images/msi-mag-b650-tomahawk-wifi_1.png	f	414	MSI MAG B650 TOMAHAWK WiFi	gallery	1	\N	web
1455	product_images/msi-mag-b650-tomahawk-wifi_2.png	f	414	MSI MAG B650 TOMAHAWK WiFi	gallery	2	\N	web
1456	product_images/asrock-b650m-pro-rs-wifi_0.png	t	415	ASRock B650M Pro RS WiFi	main	0	\N	web
1457	product_images/asrock-b650m-pro-rs-wifi_1.png	f	415	ASRock B650M Pro RS WiFi	gallery	1	\N	web
1458	product_images/asrock-b650m-pro-rs-wifi_2.png	f	415	ASRock B650M Pro RS WiFi	gallery	2	\N	web
1459	product_images/msi-mpg-x670e-carbon-wifi_0.jpg	t	416	MSI MPG X670E Carbon WiFi	main	0	\N	web
1460	product_images/msi-mpg-x670e-carbon-wifi_2.jpg	f	416	MSI MPG X670E Carbon WiFi	gallery	2	\N	web
1461	product_images/msi-mpg-x670e-carbon-wifi_4.jpg	f	416	MSI MPG X670E Carbon WiFi	gallery	4	\N	web
1462	product_images/gigabyte-b550-aorus-elite-v2_0.png	t	417	Gigabyte B550 AORUS Elite V2	main	0	\N	web
1463	product_images/gigabyte-b550-aorus-elite-v2_1.png	f	417	Gigabyte B550 AORUS Elite V2	gallery	1	\N	web
1464	product_images/gigabyte-b550-aorus-elite-v2_2.png	f	417	Gigabyte B550 AORUS Elite V2	gallery	2	\N	web
1465	product_images/asus-rog-crosshair-x670e-hero_0.png	t	418	ASUS ROG Crosshair X670E Hero	main	0	\N	web
1466	product_images/asus-rog-crosshair-x670e-hero_2.jpg	f	418	ASUS ROG Crosshair X670E Hero	gallery	2	\N	web
1467	product_images/asus-rog-crosshair-x670e-hero_3.jpg	f	418	ASUS ROG Crosshair X670E Hero	gallery	3	\N	web
1468	product_images/kingston-fury-beast-ddr5-32gb-2x16-5600mhz_1.jpg	f	419	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz	gallery	1	\N	web
1469	product_images/kingston-fury-beast-ddr5-32gb-2x16-5600mhz_2.jpg	f	419	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz	gallery	2	\N	web
1470	product_images/kingston-fury-beast-ddr5-32gb-2x16-5600mhz_3.jpg	f	419	Kingston Fury Beast DDR5 32GB (2×16GB) 5600MHz	gallery	3	\N	web
1471	product_images/corsair-vengeance-ddr5-32gb-2x16-6000mhz-rgb_0.jpg	t	420	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB	main	0	\N	web
1472	product_images/corsair-vengeance-ddr5-32gb-2x16-6000mhz-rgb_2.jpg	f	420	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB	gallery	2	\N	web
1473	product_images/corsair-vengeance-ddr5-32gb-2x16-6000mhz-rgb_3.jpg	f	420	Corsair Vengeance DDR5 32GB (2×16GB) 6000MHz RGB	gallery	3	\N	web
1474	product_images/gskill-trident-z5-rgb-ddr5-32gb-2x16-6400mhz_0.jpg	t	421	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz	main	0	\N	web
1475	product_images/gskill-trident-z5-rgb-ddr5-32gb-2x16-6400mhz_2.webp	f	421	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz	gallery	2	\N	web
1476	product_images/gskill-trident-z5-rgb-ddr5-32gb-2x16-6400mhz_5.jpg	f	421	G.Skill Trident Z5 RGB DDR5 32GB (2×16GB) 6400MHz	gallery	5	\N	web
1477	product_images/crucial-pro-ddr5-32gb-2x16-5600mhz_2.jpg	f	422	Crucial Pro DDR5 32GB (2×16GB) 5600MHz	gallery	2	\N	web
1478	product_images/crucial-pro-ddr5-32gb-2x16-5600mhz_3.webp	f	422	Crucial Pro DDR5 32GB (2×16GB) 5600MHz	gallery	3	\N	web
1479	product_images/crucial-pro-ddr5-32gb-2x16-5600mhz_4.png	f	422	Crucial Pro DDR5 32GB (2×16GB) 5600MHz	gallery	4	\N	web
1480	product_images/crucial-pro-ddr4-32gb-2x16-3200mhz_0.jpg	t	423	Crucial Pro DDR4 32GB (2×16GB) 3200MHz	main	0	\N	web
1481	product_images/teamgroup-t-force-delta-rgb-ddr5-64gb-2x32-6000mhz_0.jpg	t	424	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz	main	0	\N	web
1482	product_images/teamgroup-t-force-delta-rgb-ddr5-64gb-2x32-6000mhz_1.jpg	f	424	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz	gallery	1	\N	web
1483	product_images/teamgroup-t-force-delta-rgb-ddr5-64gb-2x32-6000mhz_2.jpg	f	424	TeamGroup T-Force Delta RGB DDR5 64GB (2×32GB) 6000MHz	gallery	2	\N	web
1484	product_images/patriot-viper-steel-ddr4-16gb-2x8-3600mhz_0.jpg	t	425	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz	main	0	\N	web
1485	product_images/patriot-viper-steel-ddr4-16gb-2x8-3600mhz_2.png	f	425	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz	gallery	2	\N	web
1486	product_images/patriot-viper-steel-ddr4-16gb-2x8-3600mhz_3.jpg	f	425	Patriot Viper Steel DDR4 16GB (2×8GB) 3600MHz	gallery	3	\N	web
1487	product_images/kingston-fury-renegade-ddr5-32gb-2x16-7200mhz_1.webp	f	426	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz	gallery	1	\N	web
1488	product_images/kingston-fury-renegade-ddr5-32gb-2x16-7200mhz_3.jpg	f	426	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz	gallery	3	\N	web
1489	product_images/kingston-fury-renegade-ddr5-32gb-2x16-7200mhz_4.jpg	f	426	Kingston Fury Renegade DDR5 32GB (2×16GB) 7200MHz	gallery	4	\N	web
1490	product_images/samsung-990-pro-2tb-nvme-m2_0.jpg	t	427	Samsung 990 PRO 2TB NVMe M.2	main	0	\N	web
1491	product_images/samsung-990-pro-2tb-nvme-m2_1.jpg	f	427	Samsung 990 PRO 2TB NVMe M.2	gallery	1	\N	web
1492	product_images/samsung-990-pro-2tb-nvme-m2_3.jpg	f	427	Samsung 990 PRO 2TB NVMe M.2	gallery	3	\N	web
1493	product_images/wd-black-sn850x-1tb-nvme-m2_1.jpg	f	428	WD Black SN850X 1TB NVMe M.2	gallery	1	\N	web
1494	product_images/wd-black-sn850x-1tb-nvme-m2_3.jpg	f	428	WD Black SN850X 1TB NVMe M.2	gallery	3	\N	web
1495	product_images/wd-black-sn850x-1tb-nvme-m2_6.jpg	f	428	WD Black SN850X 1TB NVMe M.2	gallery	6	\N	web
1496	product_images/kingston-kc3000-2tb-nvme-m2_0.jpg	t	429	Kingston KC3000 2TB NVMe M.2	main	0	\N	web
1497	product_images/kingston-kc3000-2tb-nvme-m2_1.jpg	f	429	Kingston KC3000 2TB NVMe M.2	gallery	1	\N	web
1498	product_images/kingston-kc3000-2tb-nvme-m2_3.jpg	f	429	Kingston KC3000 2TB NVMe M.2	gallery	3	\N	web
1499	product_images/crucial-t700-1tb-nvme-m2-pcie-5_0.png	t	430	Crucial T700 1TB NVMe M.2 PCIe 5.0	main	0	\N	web
1500	product_images/crucial-t700-1tb-nvme-m2-pcie-5_2.jpg	f	430	Crucial T700 1TB NVMe M.2 PCIe 5.0	gallery	2	\N	web
1501	product_images/crucial-t700-1tb-nvme-m2-pcie-5_4.jpg	f	430	Crucial T700 1TB NVMe M.2 PCIe 5.0	gallery	4	\N	web
1502	product_images/samsung-870-evo-1tb-sata-25_2.jpg	f	431	Samsung 870 EVO 1TB SATA 2.5"	gallery	2	\N	web
1503	product_images/samsung-870-evo-1tb-sata-25_5.jpg	f	431	Samsung 870 EVO 1TB SATA 2.5"	gallery	5	\N	web
1504	product_images/wd-blue-sn580-1tb-nvme-m2_0.jpg	t	432	WD Blue SN580 1TB NVMe M.2	main	0	\N	web
1505	product_images/wd-blue-sn580-1tb-nvme-m2_2.jpg	f	432	WD Blue SN580 1TB NVMe M.2	gallery	2	\N	web
1506	product_images/wd-blue-sn580-1tb-nvme-m2_3.webp	f	432	WD Blue SN580 1TB NVMe M.2	gallery	3	\N	web
1507	product_images/seagate-barracuda-4tb-hdd-35_0.jpg	t	433	Seagate BarraCuda 4TB HDD 3.5"	main	0	\N	web
1508	product_images/seagate-barracuda-4tb-hdd-35_1.jpg	f	433	Seagate BarraCuda 4TB HDD 3.5"	gallery	1	\N	web
1509	product_images/seagate-barracuda-4tb-hdd-35_3.jpg	f	433	Seagate BarraCuda 4TB HDD 3.5"	gallery	3	\N	web
1510	product_images/wd-red-plus-8tb-nas-hdd-35_0.png	t	434	WD Red Plus 8TB NAS HDD 3.5"	main	0	\N	web
1511	product_images/wd-red-plus-8tb-nas-hdd-35_2.jpg	f	434	WD Red Plus 8TB NAS HDD 3.5"	gallery	2	\N	web
1512	product_images/wd-red-plus-8tb-nas-hdd-35_4.png	f	434	WD Red Plus 8TB NAS HDD 3.5"	gallery	4	\N	web
1513	product_images/toshiba-n300-12tb-nas-hdd-35_0.jpg	t	435	Toshiba N300 12TB NAS HDD 3.5"	main	0	\N	web
1514	product_images/toshiba-n300-12tb-nas-hdd-35_2.jpg	f	435	Toshiba N300 12TB NAS HDD 3.5"	gallery	2	\N	web
1515	product_images/toshiba-n300-12tb-nas-hdd-35_3.jpg	f	435	Toshiba N300 12TB NAS HDD 3.5"	gallery	3	\N	web
1516	product_images/seagate-ironwolf-4tb-nas-hdd-35_0.jpg	t	436	Seagate IronWolf 4TB NAS HDD 3.5"	main	0	\N	web
1517	product_images/seagate-ironwolf-4tb-nas-hdd-35_1.jpg	f	436	Seagate IronWolf 4TB NAS HDD 3.5"	gallery	1	\N	web
1518	product_images/seagate-ironwolf-4tb-nas-hdd-35_2.jpg	f	436	Seagate IronWolf 4TB NAS HDD 3.5"	gallery	2	\N	web
1519	product_images/corsair-rm850x-2024-850w-80plus-gold_0.jpg	t	437	Corsair RM850x (2024) 850W 80+ Gold	main	0	\N	web
1520	product_images/corsair-rm850x-2024-850w-80plus-gold_2.jpg	f	437	Corsair RM850x (2024) 850W 80+ Gold	gallery	2	\N	web
1521	product_images/corsair-rm850x-2024-850w-80plus-gold_3.jpg	f	437	Corsair RM850x (2024) 850W 80+ Gold	gallery	3	\N	web
1522	product_images/be-quiet-dark-power-13-1000w-80plus-titanium_0.jpg	t	438	be quiet! Dark Power 13 1000W 80+ Titanium	main	0	\N	web
1523	product_images/be-quiet-dark-power-13-1000w-80plus-titanium_1.jpg	f	438	be quiet! Dark Power 13 1000W 80+ Titanium	gallery	1	\N	web
1524	product_images/be-quiet-dark-power-13-1000w-80plus-titanium_2.jpg	f	438	be quiet! Dark Power 13 1000W 80+ Titanium	gallery	2	\N	web
1525	product_images/seasonic-focus-gx-750-750w-80plus-gold_1.jpg	f	439	Seasonic Focus GX-750 750W 80+ Gold	gallery	1	\N	web
1526	product_images/seasonic-focus-gx-750-750w-80plus-gold_2.jpg	f	439	Seasonic Focus GX-750 750W 80+ Gold	gallery	2	\N	web
1527	product_images/seasonic-focus-gx-750-750w-80plus-gold_3.jpg	f	439	Seasonic Focus GX-750 750W 80+ Gold	gallery	3	\N	web
1528	product_images/cooler-master-mwe-gold-650-v2-650w-80plus-gold_0.jpg	t	440	Cooler Master MWE Gold 650 V2 650W 80+ Gold	main	0	\N	web
1529	product_images/cooler-master-mwe-gold-650-v2-650w-80plus-gold_1.jpg	f	440	Cooler Master MWE Gold 650 V2 650W 80+ Gold	gallery	1	\N	web
1530	product_images/cooler-master-mwe-gold-650-v2-650w-80plus-gold_3.jpg	f	440	Cooler Master MWE Gold 650 V2 650W 80+ Gold	gallery	3	\N	web
1531	product_images/evga-supernova-850-gt-850w-80plus-gold_0.png	t	441	EVGA SuperNOVA 850 GT 850W 80+ Gold	main	0	\N	web
1532	product_images/evga-supernova-850-gt-850w-80plus-gold_1.jpg	f	441	EVGA SuperNOVA 850 GT 850W 80+ Gold	gallery	1	\N	web
1533	product_images/evga-supernova-850-gt-850w-80plus-gold_2.jpg	f	441	EVGA SuperNOVA 850 GT 850W 80+ Gold	gallery	2	\N	web
1534	product_images/corsair-rm750e-750w-80plus-gold_0.png	t	442	Corsair RM750e 750W 80+ Gold	main	0	\N	web
1535	product_images/corsair-rm750e-750w-80plus-gold_3.jpg	f	442	Corsair RM750e 750W 80+ Gold	gallery	3	\N	web
1536	product_images/corsair-rm750e-750w-80plus-gold_4.jpg	f	442	Corsair RM750e 750W 80+ Gold	gallery	4	\N	web
1537	product_images/deepcool-pq1000m-1000w-80plus-gold_0.jpg	t	443	DeepCool PQ1000M 1000W 80+ Gold	main	0	\N	web
1538	product_images/deepcool-pq1000m-1000w-80plus-gold_4.jpg	f	443	DeepCool PQ1000M 1000W 80+ Gold	gallery	4	\N	web
1539	product_images/deepcool-pq1000m-1000w-80plus-gold_5.jpg	f	443	DeepCool PQ1000M 1000W 80+ Gold	gallery	5	\N	web
1540	product_images/be-quiet-pure-power-12-m-750w-80plus-gold_0.jpg	t	444	be quiet! Pure Power 12 M 750W 80+ Gold	main	0	\N	web
1541	product_images/be-quiet-pure-power-12-m-750w-80plus-gold_1.jpg	f	444	be quiet! Pure Power 12 M 750W 80+ Gold	gallery	1	\N	web
1542	product_images/be-quiet-pure-power-12-m-750w-80plus-gold_2.jpg	f	444	be quiet! Pure Power 12 M 750W 80+ Gold	gallery	2	\N	web
1543	product_images/cooler-master-masterbox-td500-mesh-v2_0.jpg	t	445	Cooler Master MasterBox TD500 Mesh V2	main	0	\N	web
1544	product_images/cooler-master-masterbox-td500-mesh-v2_1.png	f	445	Cooler Master MasterBox TD500 Mesh V2	gallery	1	\N	web
1545	product_images/cooler-master-masterbox-td500-mesh-v2_3.jpg	f	445	Cooler Master MasterBox TD500 Mesh V2	gallery	3	\N	web
1546	product_images/fractal-design-north-charcoal-black_0.png	t	446	Fractal Design North Charcoal Black	main	0	\N	web
1547	product_images/fractal-design-north-charcoal-black_1.jpg	f	446	Fractal Design North Charcoal Black	gallery	1	\N	web
1548	product_images/fractal-design-north-charcoal-black_2.png	f	446	Fractal Design North Charcoal Black	gallery	2	\N	web
1549	product_images/nzxt-h7-flow_0.png	t	447	NZXT H7 Flow	main	0	\N	web
1550	product_images/nzxt-h7-flow_2.png	f	447	NZXT H7 Flow	gallery	2	\N	web
1551	product_images/nzxt-h7-flow_3.jpg	f	447	NZXT H7 Flow	gallery	3	\N	web
1552	product_images/corsair-4000d-airflow_0.jpg	t	448	Corsair 4000D Airflow	main	0	\N	web
1553	product_images/corsair-4000d-airflow_1.jpg	f	448	Corsair 4000D Airflow	gallery	1	\N	web
1554	product_images/corsair-4000d-airflow_3.png	f	448	Corsair 4000D Airflow	gallery	3	\N	web
1555	product_images/lian-li-o11-dynamic-evo_0.jpg	t	449	Lian Li O11 Dynamic EVO	main	0	\N	web
1556	product_images/lian-li-o11-dynamic-evo_1.webp	f	449	Lian Li O11 Dynamic EVO	gallery	1	\N	web
1557	product_images/lian-li-o11-dynamic-evo_2.jpg	f	449	Lian Li O11 Dynamic EVO	gallery	2	\N	web
1558	product_images/be-quiet-silent-base-802_1.jpg	f	450	be quiet! Silent Base 802	gallery	1	\N	web
1559	product_images/be-quiet-silent-base-802_2.jpg	f	450	be quiet! Silent Base 802	gallery	2	\N	web
1560	product_images/be-quiet-silent-base-802_3.jpg	f	450	be quiet! Silent Base 802	gallery	3	\N	web
1561	product_images/noctua-nh-d15-chromax-black_0.jpg	t	451	Noctua NH-D15 chromax.black	main	0	\N	web
1562	product_images/noctua-nh-d15-chromax-black_1.jpg	f	451	Noctua NH-D15 chromax.black	gallery	1	\N	web
1563	product_images/noctua-nh-d15-chromax-black_3.jpg	f	451	Noctua NH-D15 chromax.black	gallery	3	\N	web
1564	product_images/deepcool-ak620_0.jpg	t	452	DeepCool AK620	main	0	\N	web
1565	product_images/deepcool-ak620_1.webp	f	452	DeepCool AK620	gallery	1	\N	web
1566	product_images/deepcool-ak620_2.jpg	f	452	DeepCool AK620	gallery	2	\N	web
1567	product_images/be-quiet-dark-rock-pro-4_0.jpg	t	453	be quiet! Dark Rock Pro 4	main	0	\N	web
1568	product_images/be-quiet-dark-rock-pro-4_2.jpg	f	453	be quiet! Dark Rock Pro 4	gallery	2	\N	web
1569	product_images/be-quiet-dark-rock-pro-4_3.png	f	453	be quiet! Dark Rock Pro 4	gallery	3	\N	web
1570	product_images/arctic-liquid-freezer-ii-360_0.webp	t	454	Arctic Liquid Freezer II 360	main	0	\N	web
1571	product_images/arctic-liquid-freezer-ii-360_1.png	f	454	Arctic Liquid Freezer II 360	gallery	1	\N	web
1572	product_images/arctic-liquid-freezer-ii-360_2.jpg	f	454	Arctic Liquid Freezer II 360	gallery	2	\N	web
1573	product_images/corsair-icue-h150i-elite-lcd-xt_0.jpg	t	455	Corsair iCUE H150i Elite LCD XT	main	0	\N	web
1574	product_images/corsair-icue-h150i-elite-lcd-xt_2.jpg	f	455	Corsair iCUE H150i Elite LCD XT	gallery	2	\N	web
1575	product_images/corsair-icue-h150i-elite-lcd-xt_3.png	f	455	Corsair iCUE H150i Elite LCD XT	gallery	3	\N	web
1576	product_images/cooler-master-hyper-212-halo-black_0.webp	t	456	Cooler Master Hyper 212 Halo Black	main	0	\N	web
1577	product_images/cooler-master-hyper-212-halo-black_1.jpg	f	456	Cooler Master Hyper 212 Halo Black	gallery	1	\N	web
1578	product_images/cooler-master-hyper-212-halo-black_3.jpg	f	456	Cooler Master Hyper 212 Halo Black	gallery	3	\N	web
1579	product_images/nzxt-kraken-x63-rgb-280mm_2.jpg	f	457	NZXT Kraken X63 RGB 280mm	gallery	2	\N	web
1580	product_images/nzxt-kraken-x63-rgb-280mm_4.png	f	457	NZXT Kraken X63 RGB 280mm	gallery	4	\N	web
1581	product_images/nzxt-kraken-x63-rgb-280mm_5.jpg	f	457	NZXT Kraken X63 RGB 280mm	gallery	5	\N	web
1582	product_images/thermalright-peerless-assassin-120-se_2.jpg	f	458	Thermalright Peerless Assassin 120 SE	gallery	2	\N	web
1583	product_images/thermalright-peerless-assassin-120-se_4.jpg	f	458	Thermalright Peerless Assassin 120 SE	gallery	4	\N	web
1584	product_images/thermalright-peerless-assassin-120-se_5.jpg	f	458	Thermalright Peerless Assassin 120 SE	gallery	5	\N	web
1585	product_images/samsung-odyssey-g7-27-qhd-240hz-curved_2.jpg	f	459	Samsung Odyssey G7 27" QHD 240Hz Curved	gallery	2	\N	web
1586	product_images/samsung-odyssey-g7-27-qhd-240hz-curved_3.jpg	f	459	Samsung Odyssey G7 27" QHD 240Hz Curved	gallery	3	\N	web
1587	product_images/samsung-odyssey-g7-27-qhd-240hz-curved_4.jpg	f	459	Samsung Odyssey G7 27" QHD 240Hz Curved	gallery	4	\N	web
1588	product_images/lg-ultragear-27gp850-b-27-qhd-165hz-nano-ips_0.jpg	t	460	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS	main	0	\N	web
1589	product_images/lg-ultragear-27gp850-b-27-qhd-165hz-nano-ips_2.jpg	f	460	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS	gallery	2	\N	web
1590	product_images/lg-ultragear-27gp850-b-27-qhd-165hz-nano-ips_4.jpg	f	460	LG UltraGear 27GP850-B 27" QHD 165Hz Nano IPS	gallery	4	\N	web
1591	product_images/asus-rog-swift-pg32ucdm-32-4k-240hz-oled_0.webp	t	461	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED	main	0	\N	web
1592	product_images/asus-rog-swift-pg32ucdm-32-4k-240hz-oled_1.jpg	f	461	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED	gallery	1	\N	web
1593	product_images/asus-rog-swift-pg32ucdm-32-4k-240hz-oled_2.png	f	461	ASUS ROG Swift PG32UCDM 32" 4K 240Hz OLED	gallery	2	\N	web
1594	product_images/dell-s2722qc-27-4k-60hz-ips_0.webp	t	462	Dell S2722QC 27" 4K 60Hz IPS	main	0	\N	web
1595	product_images/dell-s2722qc-27-4k-60hz-ips_1.jpg	f	462	Dell S2722QC 27" 4K 60Hz IPS	gallery	1	\N	web
1596	product_images/dell-s2722qc-27-4k-60hz-ips_2.jpg	f	462	Dell S2722QC 27" 4K 60Hz IPS	gallery	2	\N	web
1597	product_images/gigabyte-m27q-27-qhd-170hz-ips_0.jpg	t	463	Gigabyte M27Q 27" QHD 170Hz IPS	main	0	\N	web
1598	product_images/gigabyte-m27q-27-qhd-170hz-ips_5.jpg	f	463	Gigabyte M27Q 27" QHD 170Hz IPS	gallery	5	\N	web
1599	product_images/gigabyte-m27q-27-qhd-170hz-ips_7.jpg	f	463	Gigabyte M27Q 27" QHD 170Hz IPS	gallery	7	\N	web
1600	product_images/benq-pd2705u-27-4k-60hz-ips-designer_1.jpg	f	464	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor	gallery	1	\N	web
1601	product_images/benq-pd2705u-27-4k-60hz-ips-designer_4.jpg	f	464	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor	gallery	4	\N	web
1602	product_images/benq-pd2705u-27-4k-60hz-ips-designer_6.jpg	f	464	BenQ PD2705U 27" 4K 60Hz IPS Designer Monitor	gallery	6	\N	web
1603	product_images/asus-proart-pa278qv-27-qhd-75hz-ips_0.webp	t	465	ASUS ProArt PA278QV 27" QHD 75Hz IPS	main	0	\N	web
1604	product_images/asus-proart-pa278qv-27-qhd-75hz-ips_1.webp	f	465	ASUS ProArt PA278QV 27" QHD 75Hz IPS	gallery	1	\N	web
1605	product_images/asus-proart-pa278qv-27-qhd-75hz-ips_3.jpg	f	465	ASUS ProArt PA278QV 27" QHD 75Hz IPS	gallery	3	\N	web
1606	product_images/asus-rog-zephyrus-g16-2025-ultra9-rtx4070_0.jpg	t	467	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070	main	0	\N	web
1607	product_images/asus-rog-zephyrus-g16-2025-ultra9-rtx4070_3.png	f	467	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070	gallery	3	\N	web
1608	product_images/asus-rog-zephyrus-g16-2025-ultra9-rtx4070_4.jpg	f	467	ASUS ROG Zephyrus G16 (2025) 16" Ultra 9 / RTX 4070	gallery	4	\N	web
1609	product_images/lenovo-legion-pro-5-16irx9-i9-rtx4060_0.jpg	t	468	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060	main	0	\N	web
1610	product_images/lenovo-legion-pro-5-16irx9-i9-rtx4060_1.jpg	f	468	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060	gallery	1	\N	web
1611	product_images/lenovo-legion-pro-5-16irx9-i9-rtx4060_2.jpg	f	468	Lenovo Legion Pro 5 16IRX9 16" i9 / RTX 4060	gallery	2	\N	web
1612	product_images/acer-predator-helios-16-i7-rtx4070_0.jpg	t	469	Acer Predator Helios 16 16" i7 / RTX 4070	main	0	\N	web
1613	product_images/acer-predator-helios-16-i7-rtx4070_2.jpg	f	469	Acer Predator Helios 16 16" i7 / RTX 4070	gallery	2	\N	web
1614	product_images/acer-predator-helios-16-i7-rtx4070_3.jpg	f	469	Acer Predator Helios 16 16" i7 / RTX 4070	gallery	3	\N	web
1615	product_images/apple-macbook-pro-16-m4-pro_0.jpg	t	470	Apple MacBook Pro 16" M4 Pro	main	0	\N	web
1616	product_images/apple-macbook-pro-16-m4-pro_1.jpg	f	470	Apple MacBook Pro 16" M4 Pro	gallery	1	\N	web
1617	product_images/apple-macbook-pro-16-m4-pro_2.jpg	f	470	Apple MacBook Pro 16" M4 Pro	gallery	2	\N	web
1618	product_images/apple-macbook-air-15-m4_0.jpg	t	471	Apple MacBook Air 15" M4	main	0	\N	web
1619	product_images/apple-macbook-air-15-m4_1.jpg	f	471	Apple MacBook Air 15" M4	gallery	1	\N	web
1620	product_images/apple-macbook-air-15-m4_2.jpg	f	471	Apple MacBook Air 15" M4	gallery	2	\N	web
1621	product_images/dell-xps-15-9530-i7-rtx4060_0.jpg	t	472	Dell XPS 15 9530 15.6" i7 / RTX 4060	main	0	\N	web
1622	product_images/dell-xps-15-9530-i7-rtx4060_1.png	f	472	Dell XPS 15 9530 15.6" i7 / RTX 4060	gallery	1	\N	web
1623	product_images/dell-xps-15-9530-i7-rtx4060_2.jpg	f	472	Dell XPS 15 9530 15.6" i7 / RTX 4060	gallery	2	\N	web
1624	product_images/hp-spectre-x360-16-ultra7-intel-arc_0.jpg	t	473	HP Spectre x360 16" Ultra 7 / Intel Arc	main	0	\N	web
1625	product_images/hp-spectre-x360-16-ultra7-intel-arc_2.jpg	f	473	HP Spectre x360 16" Ultra 7 / Intel Arc	gallery	2	\N	web
1626	product_images/hp-spectre-x360-16-ultra7-intel-arc_3.jpg	f	473	HP Spectre x360 16" Ultra 7 / Intel Arc	gallery	3	\N	web
1627	product_images/lenovo-thinkpad-x1-carbon-gen12-ultra7_0.jpg	t	474	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7	main	0	\N	web
1628	product_images/lenovo-thinkpad-x1-carbon-gen12-ultra7_1.jpg	f	474	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7	gallery	1	\N	web
1629	product_images/lenovo-thinkpad-x1-carbon-gen12-ultra7_2.jpg	f	474	Lenovo ThinkPad X1 Carbon Gen 12 14" Ultra 7	gallery	2	\N	web
1630	product_images/logitech-g-pro-x-superlight-2_0.png	t	475	Logitech G Pro X Superlight 2	main	0	\N	web
1631	product_images/logitech-g-pro-x-superlight-2_1.jpg	f	475	Logitech G Pro X Superlight 2	gallery	1	\N	web
1632	product_images/logitech-g-pro-x-superlight-2_2.png	f	475	Logitech G Pro X Superlight 2	gallery	2	\N	web
1633	product_images/razer-deathadder-v3-pro_0.jpg	t	476	Razer DeathAdder V3 Pro	main	0	\N	web
1634	product_images/razer-deathadder-v3-pro_1.png	f	476	Razer DeathAdder V3 Pro	gallery	1	\N	web
1635	product_images/razer-deathadder-v3-pro_3.jpg	f	476	Razer DeathAdder V3 Pro	gallery	3	\N	web
1636	product_images/logitech-g502-x-plus_0.png	t	477	Logitech G502 X Plus	main	0	\N	web
1637	product_images/logitech-g502-x-plus_1.jpg	f	477	Logitech G502 X Plus	gallery	1	\N	web
1638	product_images/logitech-g502-x-plus_2.jpg	f	477	Logitech G502 X Plus	gallery	2	\N	web
1639	product_images/razer-basilisk-v3-pro_0.jpg	t	478	Razer Basilisk V3 Pro	main	0	\N	web
1640	product_images/razer-basilisk-v3-pro_1.jpg	f	478	Razer Basilisk V3 Pro	gallery	1	\N	web
1641	product_images/razer-basilisk-v3-pro_3.jpg	f	478	Razer Basilisk V3 Pro	gallery	3	\N	web
1642	product_images/steelseries-rival-5_0.jpg	t	479	SteelSeries Rival 5	main	0	\N	web
1643	product_images/steelseries-rival-5_1.png	f	479	SteelSeries Rival 5	gallery	1	\N	web
1644	product_images/steelseries-rival-5_2.jpg	f	479	SteelSeries Rival 5	gallery	2	\N	web
1645	product_images/zowie-ec2-c_1.jpg	f	480	Zowie EC2-C	gallery	1	\N	web
1646	product_images/zowie-ec2-c_2.jpg	f	480	Zowie EC2-C	gallery	2	\N	web
1647	product_images/zowie-ec2-c_3.png	f	480	Zowie EC2-C	gallery	3	\N	web
1648	product_images/steelseries-apex-pro-tkl-2025-wireless_0.webp	t	481	SteelSeries Apex Pro TKL (2025) Wireless	main	0	\N	web
1649	product_images/steelseries-apex-pro-tkl-2025-wireless_1.png	f	481	SteelSeries Apex Pro TKL (2025) Wireless	gallery	1	\N	web
1650	product_images/steelseries-apex-pro-tkl-2025-wireless_3.jpg	f	481	SteelSeries Apex Pro TKL (2025) Wireless	gallery	3	\N	web
1651	product_images/razer-blackwidow-v4-pro_0.webp	t	482	Razer BlackWidow V4 Pro	main	0	\N	web
1652	product_images/razer-blackwidow-v4-pro_1.jpg	f	482	Razer BlackWidow V4 Pro	gallery	1	\N	web
1653	product_images/razer-blackwidow-v4-pro_2.jpg	f	482	Razer BlackWidow V4 Pro	gallery	2	\N	web
1654	product_images/logitech-g915-tkl-wireless_0.jpg	t	483	Logitech G915 TKL Wireless	main	0	\N	web
1655	product_images/logitech-g915-tkl-wireless_1.jpg	f	483	Logitech G915 TKL Wireless	gallery	1	\N	web
1656	product_images/logitech-g915-tkl-wireless_2.jpg	f	483	Logitech G915 TKL Wireless	gallery	2	\N	web
1657	product_images/keychron-q1-pro-qmk-via-wireless_0.jpg	t	484	Keychron Q1 Pro QMK/VIA Wireless	main	0	\N	web
1658	product_images/keychron-q1-pro-qmk-via-wireless_1.jpg	f	484	Keychron Q1 Pro QMK/VIA Wireless	gallery	1	\N	web
1659	product_images/keychron-q1-pro-qmk-via-wireless_2.jpg	f	484	Keychron Q1 Pro QMK/VIA Wireless	gallery	2	\N	web
1660	product_images/ducky-one-3-classic-tkl_0.jpg	t	485	Ducky One 3 Classic TKL	main	0	\N	web
1661	product_images/ducky-one-3-classic-tkl_1.webp	f	485	Ducky One 3 Classic TKL	gallery	1	\N	web
1662	product_images/ducky-one-3-classic-tkl_3.webp	f	485	Ducky One 3 Classic TKL	gallery	3	\N	web
1663	product_images/corsair-k70-rgb-pro_0.jpg	t	486	Corsair K70 RGB Pro	main	0	\N	web
1664	product_images/corsair-k70-rgb-pro_2.jpg	f	486	Corsair K70 RGB Pro	gallery	2	\N	web
1665	product_images/corsair-k70-rgb-pro_3.jpg	f	486	Corsair K70 RGB Pro	gallery	3	\N	web
1666	product_images/hyperx-cloud-iii-wireless_0.jpg	t	487	HyperX Cloud III Wireless	main	0	\N	web
1667	product_images/hyperx-cloud-iii-wireless_1.jpg	f	487	HyperX Cloud III Wireless	gallery	1	\N	web
1668	product_images/hyperx-cloud-iii-wireless_3.jpg	f	487	HyperX Cloud III Wireless	gallery	3	\N	web
1669	product_images/steelseries-arctis-nova-pro-wireless_0.png	t	488	SteelSeries Arctis Nova Pro Wireless	main	0	\N	web
1670	product_images/steelseries-arctis-nova-pro-wireless_1.jpg	f	488	SteelSeries Arctis Nova Pro Wireless	gallery	1	\N	web
1671	product_images/steelseries-arctis-nova-pro-wireless_2.jpg	f	488	SteelSeries Arctis Nova Pro Wireless	gallery	2	\N	web
1672	product_images/razer-blackshark-v2-pro-2024_0.png	t	489	Razer BlackShark V2 Pro (2024)	main	0	\N	web
1673	product_images/razer-blackshark-v2-pro-2024_1.jpg	f	489	Razer BlackShark V2 Pro (2024)	gallery	1	\N	web
1674	product_images/razer-blackshark-v2-pro-2024_3.jpg	f	489	Razer BlackShark V2 Pro (2024)	gallery	3	\N	web
1675	product_images/logitech-g-pro-x-2-lightspeed_0.jpg	t	490	Logitech G Pro X 2 Lightspeed	main	0	\N	web
1676	product_images/logitech-g-pro-x-2-lightspeed_1.jpg	f	490	Logitech G Pro X 2 Lightspeed	gallery	1	\N	web
1677	product_images/logitech-g-pro-x-2-lightspeed_3.png	f	490	Logitech G Pro X 2 Lightspeed	gallery	3	\N	web
\.


--
-- Data for Name: products_productvariant; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productvariant (id, sku, name, price_override, is_active, sort_order, product_id) FROM stdin;
85	CMK32GX5M2B6000	32GB (2×16) 6000MHz	\N	t	0	420
86	CMK64GX5M2B6000	64GB (2×32) 6000MHz	18500.00	t	1	420
87	MZ-V9P1T0BW	1TB	8700.00	t	2	427
88	MZ-V9P2T0BW	2TB	\N	t	3	427
89	MZ-V9P4T0BW	4TB	27400.00	t	4	427
90	GU605MI-QR107W	Ultra 9 / RTX 4070 / 32GB / 1TB	\N	t	5	467
91	GU605MI-QR064W	Ultra 7 / RTX 4060 / 16GB / 512GB	124000.00	t	6	467
92	MBP16-M4P-24-512	M4 Pro 24GB / 512GB	\N	t	7	470
93	MBP16-M4P-48-1T	M4 Pro 48GB / 1TB	278000.00	t	8	470
94	910-006636	Black	\N	t	9	475
95	910-006637	White	\N	t	0	475
96	910-006638	Pink	\N	t	1	475
\.


--
-- Data for Name: products_productvideo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_productvideo (id, title, url, platform, thumbnail, sort_order, created_at, product_id) FROM stdin;
\.


--
-- Data for Name: products_promocampaign; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_promocampaign (id, name, slug, description, is_active, start_date, end_date, banner_image, priority) FROM stdin;
\.


--
-- Data for Name: products_promotionblock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_promotionblock (id, title, slug, description, is_active, sort_order, created_at) FROM stdin;
\.


--
-- Data for Name: products_promotionblock_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_promotionblock_categories (id, promotionblock_id, category_id) FROM stdin;
\.


--
-- Data for Name: products_promotionblock_products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_promotionblock_products (id, promotionblock_id, product_id) FROM stdin;
\.


--
-- Data for Name: products_review; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_review (id, rating, created_at, customer_id, product_id, text, updated_at, verified_purchase) FROM stdin;
\.


--
-- Data for Name: products_reviewimage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_reviewimage (id, image, sort_order, review_id) FROM stdin;
\.


--
-- Data for Name: products_stock; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_stock (id, warehouse, quantity, reserved, product_id, variant_id) FROM stdin;
477	default	50	0	395	\N
478	default	50	0	396	\N
479	default	50	0	397	\N
480	default	50	0	398	\N
481	default	50	0	399	\N
482	default	50	0	400	\N
483	default	50	0	401	\N
484	default	50	0	402	\N
485	default	50	0	403	\N
486	default	50	0	404	\N
487	default	50	0	405	\N
488	default	50	0	406	\N
489	default	50	0	407	\N
490	default	50	0	408	\N
491	default	50	0	409	\N
492	default	50	0	410	\N
493	default	50	0	411	\N
494	default	50	0	412	\N
495	default	50	0	413	\N
496	default	50	0	414	\N
497	default	50	0	415	\N
498	default	50	0	416	\N
499	default	50	0	417	\N
500	default	50	0	418	\N
501	default	50	0	419	\N
502	default	50	0	420	\N
503	default	30	0	\N	85
504	default	30	0	\N	86
505	default	50	0	421	\N
506	default	50	0	422	\N
507	default	50	0	423	\N
508	default	50	0	424	\N
509	default	50	0	425	\N
510	default	50	0	426	\N
511	default	50	0	427	\N
512	default	30	0	\N	87
513	default	30	0	\N	88
514	default	30	0	\N	89
515	default	50	0	428	\N
516	default	50	0	429	\N
517	default	50	0	430	\N
518	default	50	0	431	\N
519	default	50	0	432	\N
520	default	50	0	433	\N
521	default	50	0	434	\N
522	default	50	0	435	\N
523	default	50	0	436	\N
524	default	50	0	437	\N
525	default	50	0	438	\N
526	default	50	0	439	\N
527	default	50	0	440	\N
528	default	50	0	441	\N
529	default	50	0	442	\N
530	default	50	0	443	\N
531	default	50	0	444	\N
532	default	50	0	445	\N
533	default	50	0	446	\N
534	default	50	0	447	\N
535	default	50	0	448	\N
536	default	50	0	449	\N
537	default	50	0	450	\N
538	default	50	0	451	\N
539	default	50	0	452	\N
540	default	50	0	453	\N
541	default	50	0	454	\N
542	default	50	0	455	\N
543	default	50	0	456	\N
544	default	50	0	457	\N
545	default	50	0	458	\N
546	default	50	0	459	\N
547	default	50	0	460	\N
548	default	50	0	461	\N
549	default	50	0	462	\N
550	default	50	0	463	\N
551	default	50	0	464	\N
552	default	50	0	465	\N
553	default	50	0	466	\N
554	default	50	0	467	\N
555	default	30	0	\N	90
556	default	30	0	\N	91
557	default	50	0	468	\N
558	default	50	0	469	\N
559	default	50	0	470	\N
560	default	30	0	\N	92
561	default	30	0	\N	93
562	default	50	0	471	\N
563	default	50	0	472	\N
564	default	50	0	473	\N
565	default	50	0	474	\N
566	default	50	0	475	\N
567	default	30	0	\N	94
568	default	30	0	\N	95
569	default	30	0	\N	96
570	default	50	0	476	\N
571	default	50	0	477	\N
572	default	50	0	478	\N
573	default	50	0	479	\N
574	default	50	0	480	\N
575	default	50	0	481	\N
576	default	50	0	482	\N
577	default	50	0	483	\N
578	default	50	0	484	\N
579	default	50	0	485	\N
580	default	50	0	486	\N
581	default	50	0	487	\N
582	default	50	0	488	\N
583	default	50	0	489	\N
584	default	50	0	490	\N
\.


--
-- Data for Name: products_supplier; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_supplier (id, name, slug, contact_person, email, phone, website, is_active, notes) FROM stdin;
\.


--
-- Data for Name: products_tag; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_tag (id, name, slug) FROM stdin;
658	flagship	flagship
659	gaming	gaming
660	raptor-lake	raptor-lake
661	unlocked	unlocked
662	mid-range	mid-range
663	budget	budget
664	entry-level	entry-level
665	3d-v-cache	3d-v-cache
666	zen-4	zen-4
667	productivity	productivity
668	zen-5	zen-5
669	rtx	rtx
670	dlss-3	dlss-3
671	4k	4k
672	1440p	1440p
673	1080p	1080p
674	rdna-3	rdna-3
675	intel-arc	intel-arc
676	xess	xess
677	ddr5	ddr5
678	wi-fi	wi-fi
679	atx	atx
680	am5	am5
681	microatx	microatx
682	ddr4	ddr4
683	am4	am4
684	overclocking	overclocking
685	5600mhz	5600mhz
686	dual-channel	dual-channel
687	6000mhz	6000mhz
688	rgb	rgb
689	6400mhz	6400mhz
690	3200mhz	3200mhz
691	64gb	64gb
692	3600mhz	3600mhz
693	7200mhz	7200mhz
694	nvme	nvme
695	pcie-4	pcie-4
696	high-end	high-end
697	pcie-5	pcie-5
698	next-gen	next-gen
699	sata	sata
700	ssd	ssd
701	reliable	reliable
702	hdd	hdd
703	5400rpm	5400rpm
704	storage	storage
705	nas	nas
706	7200rpm	7200rpm
707	cmr	cmr
708	high-capacity	high-capacity
709	5900rpm	5900rpm
710	modular	modular
711	850w	850w
712	gold	gold
713	quiet	quiet
714	1000w	1000w
715	titanium	titanium
716	750w	750w
717	compact	compact
718	650w	650w
719	non-modular	non-modular
720	low-noise	low-noise
721	atx-3	atx-3
722	semi-modular	semi-modular
723	mid-tower	mid-tower
724	mesh	mesh
725	tempered-glass	tempered-glass
726	wood	wood
727	elegant	elegant
728	airflow	airflow
729	minimalist	minimalist
730	dual-chamber	dual-chamber
731	watercooling	watercooling
732	silent	silent
733	insulated	insulated
734	air-cooling	air-cooling
735	dual-tower	dual-tower
736	140mm	140mm
737	120mm	120mm
738	aio	aio
739	360mm	360mm
740	lcd-display	lcd-display
741	single-tower	single-tower
742	280mm	280mm
743	mirror-display	mirror-display
744	best-value	best-value
745	240hz	240hz
746	qhd	qhd
747	curved	curved
748	va	va
749	165hz	165hz
750	nano-ips	nano-ips
751	hdr	hdr
752	oled	oled
753	office	office
754	ips	ips
755	usb-c	usb-c
756	170hz	170hz
757	kvm	kvm
758	professional	professional
759	color-accurate	color-accurate
760	144hz	144hz
761	hdr600	hdr600
762	rtx-4070	rtx-4070
763	ultra-9	ultra-9
764	rtx-4060	rtx-4060
765	i9	i9
766	i7	i7
767	mini-led	mini-led
768	workstation	workstation
769	m4-pro	m4-pro
770	liquid-retina-xdr	liquid-retina-xdr
771	macos	macos
772	ultrabook	ultrabook
773	m4	m4
774	fanless	fanless
775	lightweight	lightweight
776	premium	premium
777	2-in-1	2-in-1
778	touch-screen	touch-screen
779	business	business
780	thinkpad	thinkpad
781	enterprise	enterprise
782	wireless	wireless
783	60g	60g
784	hero-2	hero-2
785	competitive	competitive
786	esports	esports
787	63g	63g
788	focus-pro-30k	focus-pro-30k
789	ergonomic	ergonomic
790	hero-25k	hero-25k
791	multi-button	multi-button
792	multi-scroll	multi-scroll
793	wired	wired
794	85g	85g
795	no-software	no-software
796	omnipoint-3	omnipoint-3
797	tkl	tkl
798	adjustable-actuation	adjustable-actuation
799	full-size	full-size
800	macro-keys	macro-keys
801	green-switch	green-switch
802	low-profile	low-profile
803	mechanical	mechanical
804	75%	75
805	aluminum	aluminum
806	hot-swap	hot-swap
807	qmk	qmk
808	pbt-keycaps	pbt-keycaps
809	cherry-mx	cherry-mx
810	media-controls	media-controls
811	120h-battery	120h-battery
812	closed-back	closed-back
813	anc	anc
814	hi-fi	hi-fi
815	hot-swap-battery	hot-swap-battery
816	70h-battery	70h-battery
817	50h-battery	50h-battery
818	graphene-driver	graphene-driver
\.


--
-- Data for Name: products_warranty; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products_warranty (id, title, duration_value, duration_unit, description, document, is_active, product_id) FROM stdin;
\.


--
-- Data for Name: services_serviceitem; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.services_serviceitem (id, name, price, category, is_active, sort_order) FROM stdin;
2	Заправка картриджа (1010/1005)	250.00	maintenance	t	0
3	Заправка картриджа (132)	300.00	repair	t	0
4	Переустановка Windows	1000.00	repair	t	0
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 184, true);


--
-- Name: customers_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_address_id_seq', 1, false);


--
-- Name: customers_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_cart_id_seq', 1, false);


--
-- Name: customers_changelog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_changelog_id_seq', 1, false);


--
-- Name: customers_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_coupon_id_seq', 1, false);


--
-- Name: customers_couponusage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_couponusage_id_seq', 1, false);


--
-- Name: customers_customer_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_customer_groups_id_seq', 1, false);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 4, true);


--
-- Name: customers_customer_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_customer_user_permissions_id_seq', 1, false);


--
-- Name: customers_customerloyalty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_customerloyalty_id_seq', 1, false);


--
-- Name: customers_delivery_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_delivery_id_seq', 1, false);


--
-- Name: customers_loyaltyprogram_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_loyaltyprogram_id_seq', 1, false);


--
-- Name: customers_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_order_id_seq', 15, true);


--
-- Name: customers_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_orderitem_id_seq', 16, true);


--
-- Name: customers_orderstatushistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_orderstatushistory_id_seq', 15, true);


--
-- Name: customers_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_payment_id_seq', 1, false);


--
-- Name: customers_viewedproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_viewedproduct_id_seq', 1, false);


--
-- Name: customers_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.customers_wishlist_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 29, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 45, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 42, true);


--
-- Name: notifications_notificationlog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_notificationlog_id_seq', 1, false);


--
-- Name: notifications_notificationsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notifications_notificationsettings_id_seq', 1, true);


--
-- Name: products_adminsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_adminsection_id_seq', 22, true);


--
-- Name: products_attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_attribute_id_seq', 303, true);


--
-- Name: products_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_banner_id_seq', 1, false);


--
-- Name: products_blogpost_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_blogpost_id_seq', 1, false);


--
-- Name: products_blogpost_related_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_blogpost_related_products_id_seq', 1, false);


--
-- Name: products_blogpost_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_blogpost_tags_id_seq', 1, false);


--
-- Name: products_category_attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_category_attributes_id_seq', 1, false);


--
-- Name: products_category_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_category_brands_id_seq', 1, false);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_category_id_seq', 231, true);


--
-- Name: products_certificate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_certificate_id_seq', 1, false);


--
-- Name: products_discount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_discount_id_seq', 1, false);


--
-- Name: products_pricehistory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_pricehistory_id_seq', 1, false);


--
-- Name: products_product_brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_product_brands_id_seq', 532, true);


--
-- Name: products_product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_product_categories_id_seq', 490, true);


--
-- Name: products_product_feature_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_product_feature_tags_id_seq', 1884, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_product_id_seq', 490, true);


--
-- Name: products_productattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productattribute_id_seq', 1718, true);


--
-- Name: products_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productimage_id_seq', 1677, true);


--
-- Name: products_productvariant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productvariant_id_seq', 96, true);


--
-- Name: products_productvideo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_productvideo_id_seq', 1, false);


--
-- Name: products_promocampaign_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_promocampaign_id_seq', 1, false);


--
-- Name: products_promotionblock_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_promotionblock_categories_id_seq', 1, false);


--
-- Name: products_promotionblock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_promotionblock_id_seq', 1, false);


--
-- Name: products_promotionblock_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_promotionblock_products_id_seq', 1, false);


--
-- Name: products_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_review_id_seq', 1, false);


--
-- Name: products_reviewimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_reviewimage_id_seq', 1, false);


--
-- Name: products_stock_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_stock_id_seq', 584, true);


--
-- Name: products_supplier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_supplier_id_seq', 1, false);


--
-- Name: products_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_tag_id_seq', 361, true);


--
-- Name: products_tag_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_tag_id_seq1', 818, true);


--
-- Name: products_warranty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.products_warranty_id_seq', 1, false);


--
-- Name: services_serviceitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.services_serviceitem_id_seq', 4, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: customers_address customers_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_address
    ADD CONSTRAINT customers_address_pkey PRIMARY KEY (id);


--
-- Name: customers_cart customers_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_cart
    ADD CONSTRAINT customers_cart_pkey PRIMARY KEY (id);


--
-- Name: customers_changelog customers_changelog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_changelog
    ADD CONSTRAINT customers_changelog_pkey PRIMARY KEY (id);


--
-- Name: customers_coupon customers_coupon_code_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_coupon
    ADD CONSTRAINT customers_coupon_code_key UNIQUE (code);


--
-- Name: customers_coupon customers_coupon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_coupon
    ADD CONSTRAINT customers_coupon_pkey PRIMARY KEY (id);


--
-- Name: customers_couponusage customers_couponusage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_couponusage
    ADD CONSTRAINT customers_couponusage_pkey PRIMARY KEY (id);


--
-- Name: customers_customer customers_customer_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer
    ADD CONSTRAINT customers_customer_email_key UNIQUE (email);


--
-- Name: customers_customer_groups customers_customer_groups_customer_id_group_id_83eb0e0e_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_groups_customer_id_group_id_83eb0e0e_uniq UNIQUE (customer_id, group_id);


--
-- Name: customers_customer_groups customers_customer_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_groups_pkey PRIMARY KEY (id);


--
-- Name: customers_customer customers_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer
    ADD CONSTRAINT customers_customer_pkey PRIMARY KEY (id);


--
-- Name: customers_customer_user_permissions customers_customer_user__customer_id_permission_i_cd47699c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_user__customer_id_permission_i_cd47699c_uniq UNIQUE (customer_id, permission_id);


--
-- Name: customers_customer_user_permissions customers_customer_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: customers_customerloyalty customers_customerloyalty_customer_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customerloyalty
    ADD CONSTRAINT customers_customerloyalty_customer_id_key UNIQUE (customer_id);


--
-- Name: customers_customerloyalty customers_customerloyalty_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customerloyalty
    ADD CONSTRAINT customers_customerloyalty_pkey PRIMARY KEY (id);


--
-- Name: customers_delivery customers_delivery_order_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_delivery
    ADD CONSTRAINT customers_delivery_order_id_key UNIQUE (order_id);


--
-- Name: customers_delivery customers_delivery_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_delivery
    ADD CONSTRAINT customers_delivery_pkey PRIMARY KEY (id);


--
-- Name: customers_loyaltyprogram customers_loyaltyprogram_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_loyaltyprogram
    ADD CONSTRAINT customers_loyaltyprogram_pkey PRIMARY KEY (id);


--
-- Name: customers_loyaltyprogram customers_loyaltyprogram_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_loyaltyprogram
    ADD CONSTRAINT customers_loyaltyprogram_slug_key UNIQUE (slug);


--
-- Name: customers_order customers_order_order_number_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_order
    ADD CONSTRAINT customers_order_order_number_key UNIQUE (order_number);


--
-- Name: customers_order customers_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_order
    ADD CONSTRAINT customers_order_pkey PRIMARY KEY (id);


--
-- Name: customers_orderitem customers_orderitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderitem
    ADD CONSTRAINT customers_orderitem_pkey PRIMARY KEY (id);


--
-- Name: customers_orderstatushistory customers_orderstatushistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderstatushistory
    ADD CONSTRAINT customers_orderstatushistory_pkey PRIMARY KEY (id);


--
-- Name: customers_payment customers_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_payment
    ADD CONSTRAINT customers_payment_pkey PRIMARY KEY (id);


--
-- Name: customers_viewedproduct customers_viewedproduct_customer_id_product_id_01ba8d44_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_viewedproduct
    ADD CONSTRAINT customers_viewedproduct_customer_id_product_id_01ba8d44_uniq UNIQUE (customer_id, product_id);


--
-- Name: customers_viewedproduct customers_viewedproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_viewedproduct
    ADD CONSTRAINT customers_viewedproduct_pkey PRIMARY KEY (id);


--
-- Name: customers_wishlist customers_wishlist_customer_id_product_id_c7c0b3de_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_wishlist
    ADD CONSTRAINT customers_wishlist_customer_id_product_id_c7c0b3de_uniq UNIQUE (customer_id, product_id);


--
-- Name: customers_wishlist customers_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_wishlist
    ADD CONSTRAINT customers_wishlist_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: notifications_notificationlog notifications_notificationlog_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications_notificationlog
    ADD CONSTRAINT notifications_notificationlog_pkey PRIMARY KEY (id);


--
-- Name: notifications_notificationsettings notifications_notificationsettings_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications_notificationsettings
    ADD CONSTRAINT notifications_notificationsettings_name_key UNIQUE (name);


--
-- Name: notifications_notificationsettings notifications_notificationsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications_notificationsettings
    ADD CONSTRAINT notifications_notificationsettings_pkey PRIMARY KEY (id);


--
-- Name: products_adminsection products_adminsection_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_adminsection
    ADD CONSTRAINT products_adminsection_key_key UNIQUE (key);


--
-- Name: products_adminsection products_adminsection_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_adminsection
    ADD CONSTRAINT products_adminsection_pkey PRIMARY KEY (id);


--
-- Name: products_attribute products_attribute_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_attribute
    ADD CONSTRAINT products_attribute_name_key UNIQUE (name);


--
-- Name: products_attribute products_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_attribute
    ADD CONSTRAINT products_attribute_pkey PRIMARY KEY (id);


--
-- Name: products_attribute products_attribute_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_attribute
    ADD CONSTRAINT products_attribute_slug_key UNIQUE (slug);


--
-- Name: products_banner products_banner_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_banner
    ADD CONSTRAINT products_banner_pkey PRIMARY KEY (id);


--
-- Name: products_blogpost products_blogpost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost
    ADD CONSTRAINT products_blogpost_pkey PRIMARY KEY (id);


--
-- Name: products_blogpost_related_products products_blogpost_relate_blogpost_id_product_id_db18a161_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_related_products
    ADD CONSTRAINT products_blogpost_relate_blogpost_id_product_id_db18a161_uniq UNIQUE (blogpost_id, product_id);


--
-- Name: products_blogpost_related_products products_blogpost_related_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_related_products
    ADD CONSTRAINT products_blogpost_related_products_pkey PRIMARY KEY (id);


--
-- Name: products_blogpost products_blogpost_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost
    ADD CONSTRAINT products_blogpost_slug_key UNIQUE (slug);


--
-- Name: products_blogpost_tags products_blogpost_tags_blogpost_id_tag_id_16be3b26_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_tags
    ADD CONSTRAINT products_blogpost_tags_blogpost_id_tag_id_16be3b26_uniq UNIQUE (blogpost_id, tag_id);


--
-- Name: products_blogpost_tags products_blogpost_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_tags
    ADD CONSTRAINT products_blogpost_tags_pkey PRIMARY KEY (id);


--
-- Name: products_category_attributes products_category_attrib_category_id_attribute_id_be9aa488_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_attributes
    ADD CONSTRAINT products_category_attrib_category_id_attribute_id_be9aa488_uniq UNIQUE (category_id, attribute_id);


--
-- Name: products_category_attributes products_category_attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_attributes
    ADD CONSTRAINT products_category_attributes_pkey PRIMARY KEY (id);


--
-- Name: products_category_brands products_category_brands_category_id_brand_id_cb11283c_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_brands
    ADD CONSTRAINT products_category_brands_category_id_brand_id_cb11283c_uniq UNIQUE (category_id, brand_id);


--
-- Name: products_category_brands products_category_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_brands
    ADD CONSTRAINT products_category_brands_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_slug_key UNIQUE (slug);


--
-- Name: products_certificate products_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_certificate
    ADD CONSTRAINT products_certificate_pkey PRIMARY KEY (id);


--
-- Name: products_discount products_discount_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_pkey PRIMARY KEY (id);


--
-- Name: products_pricehistory products_pricehistory_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_pricehistory
    ADD CONSTRAINT products_pricehistory_pkey PRIMARY KEY (id);


--
-- Name: products_product_brands products_product_brands_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_brands
    ADD CONSTRAINT products_product_brands_pkey PRIMARY KEY (id);


--
-- Name: products_product_brands products_product_brands_product_id_brand_id_3fa625df_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_brands
    ADD CONSTRAINT products_product_brands_product_id_brand_id_3fa625df_uniq UNIQUE (product_id, brand_id);


--
-- Name: products_product_categories products_product_categor_product_id_category_id_a1f87bda_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_categories
    ADD CONSTRAINT products_product_categor_product_id_category_id_a1f87bda_uniq UNIQUE (product_id, category_id);


--
-- Name: products_product_categories products_product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_categories
    ADD CONSTRAINT products_product_categories_pkey PRIMARY KEY (id);


--
-- Name: products_product_feature_tags products_product_feature_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_feature_tags
    ADD CONSTRAINT products_product_feature_tags_pkey PRIMARY KEY (id);


--
-- Name: products_product_feature_tags products_product_feature_tags_product_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_feature_tags
    ADD CONSTRAINT products_product_feature_tags_product_id_tag_id_key UNIQUE (product_id, tag_id);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_product products_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_slug_key UNIQUE (slug);


--
-- Name: products_productattribute products_productattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT products_productattribute_pkey PRIMARY KEY (id);


--
-- Name: products_productimage products_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimage_pkey PRIMARY KEY (id);


--
-- Name: products_productvariant products_productvariant_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvariant
    ADD CONSTRAINT products_productvariant_pkey PRIMARY KEY (id);


--
-- Name: products_productvariant products_productvariant_sku_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvariant
    ADD CONSTRAINT products_productvariant_sku_key UNIQUE (sku);


--
-- Name: products_productvideo products_productvideo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvideo
    ADD CONSTRAINT products_productvideo_pkey PRIMARY KEY (id);


--
-- Name: products_promocampaign products_promocampaign_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promocampaign
    ADD CONSTRAINT products_promocampaign_pkey PRIMARY KEY (id);


--
-- Name: products_promocampaign products_promocampaign_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promocampaign
    ADD CONSTRAINT products_promocampaign_slug_key UNIQUE (slug);


--
-- Name: products_promotionblock_categories products_promotionblock__promotionblock_id_catego_ece4c1df_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_categories
    ADD CONSTRAINT products_promotionblock__promotionblock_id_catego_ece4c1df_uniq UNIQUE (promotionblock_id, category_id);


--
-- Name: products_promotionblock_products products_promotionblock__promotionblock_id_produc_0dc90576_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_products
    ADD CONSTRAINT products_promotionblock__promotionblock_id_produc_0dc90576_uniq UNIQUE (promotionblock_id, product_id);


--
-- Name: products_promotionblock_categories products_promotionblock_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_categories
    ADD CONSTRAINT products_promotionblock_categories_pkey PRIMARY KEY (id);


--
-- Name: products_promotionblock products_promotionblock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock
    ADD CONSTRAINT products_promotionblock_pkey PRIMARY KEY (id);


--
-- Name: products_promotionblock_products products_promotionblock_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_products
    ADD CONSTRAINT products_promotionblock_products_pkey PRIMARY KEY (id);


--
-- Name: products_promotionblock products_promotionblock_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock
    ADD CONSTRAINT products_promotionblock_slug_key UNIQUE (slug);


--
-- Name: products_review products_review_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_pkey PRIMARY KEY (id);


--
-- Name: products_review products_review_product_id_customer_id_aea431ea_uniq; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_product_id_customer_id_aea431ea_uniq UNIQUE (product_id, customer_id);


--
-- Name: products_reviewimage products_reviewimage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_reviewimage
    ADD CONSTRAINT products_reviewimage_pkey PRIMARY KEY (id);


--
-- Name: products_stock products_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT products_stock_pkey PRIMARY KEY (id);


--
-- Name: products_supplier products_supplier_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_supplier
    ADD CONSTRAINT products_supplier_pkey PRIMARY KEY (id);


--
-- Name: products_supplier products_supplier_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_supplier
    ADD CONSTRAINT products_supplier_slug_key UNIQUE (slug);


--
-- Name: products_brand products_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_brand
    ADD CONSTRAINT products_tag_name_key UNIQUE (name);


--
-- Name: products_tag products_tag_name_key1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_tag
    ADD CONSTRAINT products_tag_name_key1 UNIQUE (name);


--
-- Name: products_brand products_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_brand
    ADD CONSTRAINT products_tag_pkey PRIMARY KEY (id);


--
-- Name: products_tag products_tag_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_tag
    ADD CONSTRAINT products_tag_pkey1 PRIMARY KEY (id);


--
-- Name: products_brand products_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_brand
    ADD CONSTRAINT products_tag_slug_key UNIQUE (slug);


--
-- Name: products_tag products_tag_slug_key1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_tag
    ADD CONSTRAINT products_tag_slug_key1 UNIQUE (slug);


--
-- Name: products_warranty products_warranty_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_warranty
    ADD CONSTRAINT products_warranty_pkey PRIMARY KEY (id);


--
-- Name: services_serviceitem services_serviceitem_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services_serviceitem
    ADD CONSTRAINT services_serviceitem_pkey PRIMARY KEY (id);


--
-- Name: products_productattribute unique_variant_attribute; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT unique_variant_attribute UNIQUE (variant_id, attribute_id);


--
-- Name: products_stock unique_variant_warehouse; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT unique_variant_warehouse UNIQUE (variant_id, warehouse);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: customers_address_customer_id_f042422e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_address_customer_id_f042422e ON public.customers_address USING btree (customer_id);


--
-- Name: customers_c_created_3f28da_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_c_created_3f28da_idx ON public.customers_changelog USING btree (created_at DESC);


--
-- Name: customers_c_model_n_b180dc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_c_model_n_b180dc_idx ON public.customers_changelog USING btree (model_name, object_id);


--
-- Name: customers_cart_customer_id_97ed88ec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_customer_id_97ed88ec ON public.customers_cart USING btree (customer_id);


--
-- Name: customers_cart_product_id_f9590726; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_product_id_f9590726 ON public.customers_cart USING btree (product_id);


--
-- Name: customers_cart_session_key_fe9c4fe9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_session_key_fe9c4fe9 ON public.customers_cart USING btree (session_key);


--
-- Name: customers_cart_session_key_fe9c4fe9_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_session_key_fe9c4fe9_like ON public.customers_cart USING btree (session_key varchar_pattern_ops);


--
-- Name: customers_cart_variant_id_6b82f2f7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_cart_variant_id_6b82f2f7 ON public.customers_cart USING btree (variant_id);


--
-- Name: customers_changelog_user_id_cc89dfbf; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_changelog_user_id_cc89dfbf ON public.customers_changelog USING btree (user_id);


--
-- Name: customers_coupon_code_6015aa33_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_coupon_code_6015aa33_like ON public.customers_coupon USING btree (code varchar_pattern_ops);


--
-- Name: customers_couponusage_coupon_id_3c40cde6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_couponusage_coupon_id_3c40cde6 ON public.customers_couponusage USING btree (coupon_id);


--
-- Name: customers_couponusage_customer_id_cf9982e0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_couponusage_customer_id_cf9982e0 ON public.customers_couponusage USING btree (customer_id);


--
-- Name: customers_couponusage_order_id_aa07dd51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_couponusage_order_id_aa07dd51 ON public.customers_couponusage USING btree (order_id);


--
-- Name: customers_customer_email_300e404b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_email_300e404b_like ON public.customers_customer USING btree (email varchar_pattern_ops);


--
-- Name: customers_customer_groups_customer_id_39e075d7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_groups_customer_id_39e075d7 ON public.customers_customer_groups USING btree (customer_id);


--
-- Name: customers_customer_groups_group_id_f079b2be; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_groups_group_id_f079b2be ON public.customers_customer_groups USING btree (group_id);


--
-- Name: customers_customer_user_permissions_customer_id_39cf3cb6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_user_permissions_customer_id_39cf3cb6 ON public.customers_customer_user_permissions USING btree (customer_id);


--
-- Name: customers_customer_user_permissions_permission_id_36492949; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customer_user_permissions_permission_id_36492949 ON public.customers_customer_user_permissions USING btree (permission_id);


--
-- Name: customers_customerloyalty_level_id_fb5f45fb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_customerloyalty_level_id_fb5f45fb ON public.customers_customerloyalty USING btree (level_id);


--
-- Name: customers_delivery_address_id_f3e68cce; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_delivery_address_id_f3e68cce ON public.customers_delivery USING btree (address_id);


--
-- Name: customers_loyaltyprogram_slug_dc3ba2d5_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_loyaltyprogram_slug_dc3ba2d5_like ON public.customers_loyaltyprogram USING btree (slug varchar_pattern_ops);


--
-- Name: customers_order_customer_id_032dd871; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_order_customer_id_032dd871 ON public.customers_order USING btree (customer_id);


--
-- Name: customers_order_order_number_b3d7f651_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_order_order_number_b3d7f651_like ON public.customers_order USING btree (order_number varchar_pattern_ops);


--
-- Name: customers_orderitem_order_id_0c19357b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderitem_order_id_0c19357b ON public.customers_orderitem USING btree (order_id);


--
-- Name: customers_orderitem_product_id_9189abb4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderitem_product_id_9189abb4 ON public.customers_orderitem USING btree (product_id);


--
-- Name: customers_orderitem_variant_id_d4b3378b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderitem_variant_id_d4b3378b ON public.customers_orderitem USING btree (variant_id);


--
-- Name: customers_orderstatushistory_changed_by_id_71ca4256; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderstatushistory_changed_by_id_71ca4256 ON public.customers_orderstatushistory USING btree (changed_by_id);


--
-- Name: customers_orderstatushistory_order_id_34a07fdc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_orderstatushistory_order_id_34a07fdc ON public.customers_orderstatushistory USING btree (order_id);


--
-- Name: customers_payment_order_id_7af7afda; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_payment_order_id_7af7afda ON public.customers_payment USING btree (order_id);


--
-- Name: customers_viewedproduct_customer_id_8fa665f2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_viewedproduct_customer_id_8fa665f2 ON public.customers_viewedproduct USING btree (customer_id);


--
-- Name: customers_viewedproduct_product_id_f902dc9b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_viewedproduct_product_id_f902dc9b ON public.customers_viewedproduct USING btree (product_id);


--
-- Name: customers_wishlist_customer_id_8554e4f5; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_wishlist_customer_id_8554e4f5 ON public.customers_wishlist USING btree (customer_id);


--
-- Name: customers_wishlist_product_id_6788646b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX customers_wishlist_product_id_6788646b ON public.customers_wishlist USING btree (product_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: notifications_notificationlog_order_id_275e19e6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_notificationlog_order_id_275e19e6 ON public.notifications_notificationlog USING btree (order_id);


--
-- Name: notifications_notificationsettings_name_de22d795_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notifications_notificationsettings_name_de22d795_like ON public.notifications_notificationsettings USING btree (name varchar_pattern_ops);


--
-- Name: products_adminsection_key_7d3f08c7_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_adminsection_key_7d3f08c7_like ON public.products_adminsection USING btree (key varchar_pattern_ops);


--
-- Name: products_at_type_f4fcf3_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_at_type_f4fcf3_idx ON public.products_attribute USING btree (type, slug);


--
-- Name: products_attribute_name_e203e819_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_attribute_name_e203e819_like ON public.products_attribute USING btree (name varchar_pattern_ops);


--
-- Name: products_attribute_slug_3436e67a_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_attribute_slug_3436e67a_like ON public.products_attribute USING btree (slug varchar_pattern_ops);


--
-- Name: products_banner_category_id_6ffcde53; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_banner_category_id_6ffcde53 ON public.products_banner USING btree (category_id);


--
-- Name: products_bl_status_aab172_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_bl_status_aab172_idx ON public.products_blogpost USING btree (status, published_at DESC);


--
-- Name: products_blogpost_author_id_567d983f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_author_id_567d983f ON public.products_blogpost USING btree (author_id);


--
-- Name: products_blogpost_related_products_blogpost_id_8b6639e4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_related_products_blogpost_id_8b6639e4 ON public.products_blogpost_related_products USING btree (blogpost_id);


--
-- Name: products_blogpost_related_products_product_id_de7a3b9d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_related_products_product_id_de7a3b9d ON public.products_blogpost_related_products USING btree (product_id);


--
-- Name: products_blogpost_slug_59c8d621_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_slug_59c8d621_like ON public.products_blogpost USING btree (slug varchar_pattern_ops);


--
-- Name: products_blogpost_tags_blogpost_id_413833f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_tags_blogpost_id_413833f9 ON public.products_blogpost_tags USING btree (blogpost_id);


--
-- Name: products_blogpost_tags_tag_id_195753d7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_blogpost_tags_tag_id_195753d7 ON public.products_blogpost_tags USING btree (tag_id);


--
-- Name: products_category_attributes_attribute_id_4cd0be2e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_attributes_attribute_id_4cd0be2e ON public.products_category_attributes USING btree (attribute_id);


--
-- Name: products_category_attributes_category_id_bf20cdc7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_attributes_category_id_bf20cdc7 ON public.products_category_attributes USING btree (category_id);


--
-- Name: products_category_brands_brand_id_fc34923b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_brands_brand_id_fc34923b ON public.products_category_brands USING btree (brand_id);


--
-- Name: products_category_brands_category_id_f3697e5d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_brands_category_id_f3697e5d ON public.products_category_brands USING btree (category_id);


--
-- Name: products_category_parent_id_3388f6c9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_parent_id_3388f6c9 ON public.products_category USING btree (parent_id);


--
-- Name: products_category_slug_c558efae_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_category_slug_c558efae_like ON public.products_category USING btree (slug varchar_pattern_ops);


--
-- Name: products_certificate_product_id_7564eb6b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_certificate_product_id_7564eb6b ON public.products_certificate USING btree (product_id);


--
-- Name: products_di_categor_a1a6ee_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_di_categor_a1a6ee_idx ON public.products_discount USING btree (category_id, is_active);


--
-- Name: products_di_product_33ad43_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_di_product_33ad43_idx ON public.products_discount USING btree (product_id, is_active);


--
-- Name: products_di_variant_7129c4_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_di_variant_7129c4_idx ON public.products_discount USING btree (variant_id, is_active);


--
-- Name: products_discount_category_id_7f843ced; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_discount_category_id_7f843ced ON public.products_discount USING btree (category_id);


--
-- Name: products_discount_product_id_c39a20cb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_discount_product_id_c39a20cb ON public.products_discount USING btree (product_id);


--
-- Name: products_discount_promo_campaign_id_22319ff1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_discount_promo_campaign_id_22319ff1 ON public.products_discount USING btree (promo_campaign_id);


--
-- Name: products_discount_variant_id_0ab210d0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_discount_variant_id_0ab210d0 ON public.products_discount USING btree (variant_id);


--
-- Name: products_pr_attribu_4705f4_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_attribu_4705f4_idx ON public.products_productattribute USING btree (attribute_id, value_enum);


--
-- Name: products_pr_attribu_87c5a9_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_attribu_87c5a9_idx ON public.products_productattribute USING btree (attribute_id, value_int);


--
-- Name: products_pr_product_66459e_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_product_66459e_idx ON public.products_productvariant USING btree (product_id, is_active);


--
-- Name: products_pr_product_94a04a_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_product_94a04a_idx ON public.products_productattribute USING btree (product_id, attribute_id);


--
-- Name: products_pr_product_f0e7be_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_product_f0e7be_idx ON public.products_pricehistory USING btree (product_id, changed_at DESC);


--
-- Name: products_pr_variant_989f38_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_variant_989f38_idx ON public.products_productattribute USING btree (variant_id, attribute_id);


--
-- Name: products_pr_variant_9e2fe6_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pr_variant_9e2fe6_idx ON public.products_pricehistory USING btree (variant_id, changed_at DESC);


--
-- Name: products_pricehistory_product_id_1fc0e3fe; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pricehistory_product_id_1fc0e3fe ON public.products_pricehistory USING btree (product_id);


--
-- Name: products_pricehistory_variant_id_7a8d8d2e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_pricehistory_variant_id_7a8d8d2e ON public.products_pricehistory USING btree (variant_id);


--
-- Name: products_product_brands_brand_id_283aac29; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_brands_brand_id_283aac29 ON public.products_product_brands USING btree (brand_id);


--
-- Name: products_product_brands_product_id_e551c83f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_brands_product_id_e551c83f ON public.products_product_brands USING btree (product_id);


--
-- Name: products_product_categories_category_id_27982bed; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_categories_category_id_27982bed ON public.products_product_categories USING btree (category_id);


--
-- Name: products_product_categories_product_id_50ef8156; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_categories_product_id_50ef8156 ON public.products_product_categories USING btree (product_id);


--
-- Name: products_product_feature_tags_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_feature_tags_product_id ON public.products_product_feature_tags USING btree (product_id);


--
-- Name: products_product_feature_tags_tag_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_feature_tags_tag_id ON public.products_product_feature_tags USING btree (tag_id);


--
-- Name: products_product_slug_70d3148d_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_product_slug_70d3148d_like ON public.products_product USING btree (slug varchar_pattern_ops);


--
-- Name: products_productattribute_attribute_id_de00002b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productattribute_attribute_id_de00002b ON public.products_productattribute USING btree (attribute_id);


--
-- Name: products_productattribute_product_id_b9a86828; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productattribute_product_id_b9a86828 ON public.products_productattribute USING btree (product_id);


--
-- Name: products_productattribute_variant_id_e4b8d9e4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productattribute_variant_id_e4b8d9e4 ON public.products_productattribute USING btree (variant_id);


--
-- Name: products_productimage_product_id_e747596a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productimage_product_id_e747596a ON public.products_productimage USING btree (product_id);


--
-- Name: products_productimage_variant_id_bf70ade8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productimage_variant_id_bf70ade8 ON public.products_productimage USING btree (variant_id);


--
-- Name: products_productvariant_product_id_d9c22902; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productvariant_product_id_d9c22902 ON public.products_productvariant USING btree (product_id);


--
-- Name: products_productvariant_sku_1b692018_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productvariant_sku_1b692018_like ON public.products_productvariant USING btree (sku varchar_pattern_ops);


--
-- Name: products_productvideo_product_id_872fe729; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_productvideo_product_id_872fe729 ON public.products_productvideo USING btree (product_id);


--
-- Name: products_promocampaign_slug_68a6d529_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promocampaign_slug_68a6d529_like ON public.products_promocampaign USING btree (slug varchar_pattern_ops);


--
-- Name: products_promotionblock_categories_category_id_80df819f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_categories_category_id_80df819f ON public.products_promotionblock_categories USING btree (category_id);


--
-- Name: products_promotionblock_categories_promotionblock_id_dadbd43e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_categories_promotionblock_id_dadbd43e ON public.products_promotionblock_categories USING btree (promotionblock_id);


--
-- Name: products_promotionblock_products_product_id_ea5f3c1a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_products_product_id_ea5f3c1a ON public.products_promotionblock_products USING btree (product_id);


--
-- Name: products_promotionblock_products_promotionblock_id_e5dfe04c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_products_promotionblock_id_e5dfe04c ON public.products_promotionblock_products USING btree (promotionblock_id);


--
-- Name: products_promotionblock_slug_003da5f5_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_promotionblock_slug_003da5f5_like ON public.products_promotionblock USING btree (slug varchar_pattern_ops);


--
-- Name: products_review_customer_id_54220657; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_review_customer_id_54220657 ON public.products_review USING btree (customer_id);


--
-- Name: products_review_product_id_d933ffa7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_review_product_id_d933ffa7 ON public.products_review USING btree (product_id);


--
-- Name: products_reviewimage_review_id_c90b3860; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_reviewimage_review_id_c90b3860 ON public.products_reviewimage USING btree (review_id);


--
-- Name: products_st_product_282fcc_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_st_product_282fcc_idx ON public.products_stock USING btree (product_id, warehouse);


--
-- Name: products_st_variant_10937e_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_st_variant_10937e_idx ON public.products_stock USING btree (variant_id, warehouse);


--
-- Name: products_stock_product_id_170f916b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_stock_product_id_170f916b ON public.products_stock USING btree (product_id);


--
-- Name: products_stock_variant_id_dc51ed5d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_stock_variant_id_dc51ed5d ON public.products_stock USING btree (variant_id);


--
-- Name: products_supplier_slug_1073577c_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_supplier_slug_1073577c_like ON public.products_supplier USING btree (slug varchar_pattern_ops);


--
-- Name: products_tag_name_df2d816e_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_tag_name_df2d816e_like ON public.products_brand USING btree (name varchar_pattern_ops);


--
-- Name: products_tag_slug_5def095b_like; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_tag_slug_5def095b_like ON public.products_brand USING btree (slug varchar_pattern_ops);


--
-- Name: products_warranty_product_id_51395474; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX products_warranty_product_id_51395474 ON public.products_warranty USING btree (product_id);


--
-- Name: unique_customer_cart_item; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_customer_cart_item ON public.customers_cart USING btree (customer_id, product_id, variant_id) WHERE ((session_key)::text = ''::text);


--
-- Name: unique_product_attribute; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_product_attribute ON public.products_productattribute USING btree (product_id, attribute_id) WHERE (variant_id IS NULL);


--
-- Name: unique_product_warehouse; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_product_warehouse ON public.products_stock USING btree (product_id, warehouse) WHERE (variant_id IS NULL);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_address customers_address_customer_id_f042422e_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_address
    ADD CONSTRAINT customers_address_customer_id_f042422e_fk_customers_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_cart customers_cart_customer_id_97ed88ec_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_cart
    ADD CONSTRAINT customers_cart_customer_id_97ed88ec_fk_customers_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_cart customers_cart_product_id_f9590726_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_cart
    ADD CONSTRAINT customers_cart_product_id_f9590726_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_cart customers_cart_variant_id_6b82f2f7_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_cart
    ADD CONSTRAINT customers_cart_variant_id_6b82f2f7_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_changelog customers_changelog_user_id_cc89dfbf_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_changelog
    ADD CONSTRAINT customers_changelog_user_id_cc89dfbf_fk_customers_customer_id FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_couponusage customers_couponusag_customer_id_cf9982e0_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_couponusage
    ADD CONSTRAINT customers_couponusag_customer_id_cf9982e0_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_couponusage customers_couponusage_coupon_id_3c40cde6_fk_customers_coupon_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_couponusage
    ADD CONSTRAINT customers_couponusage_coupon_id_3c40cde6_fk_customers_coupon_id FOREIGN KEY (coupon_id) REFERENCES public.customers_coupon(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_couponusage customers_couponusage_order_id_aa07dd51_fk_customers_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_couponusage
    ADD CONSTRAINT customers_couponusage_order_id_aa07dd51_fk_customers_order_id FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_groups customers_customer_g_customer_id_39e075d7_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_g_customer_id_39e075d7_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_groups customers_customer_groups_group_id_f079b2be_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_groups
    ADD CONSTRAINT customers_customer_groups_group_id_f079b2be_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_user_permissions customers_customer_u_customer_id_39cf3cb6_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_u_customer_id_39cf3cb6_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customer_user_permissions customers_customer_u_permission_id_36492949_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customer_user_permissions
    ADD CONSTRAINT customers_customer_u_permission_id_36492949_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customerloyalty customers_customerlo_customer_id_539068e4_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customerloyalty
    ADD CONSTRAINT customers_customerlo_customer_id_539068e4_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_customerloyalty customers_customerlo_level_id_fb5f45fb_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_customerloyalty
    ADD CONSTRAINT customers_customerlo_level_id_fb5f45fb_fk_customers FOREIGN KEY (level_id) REFERENCES public.customers_loyaltyprogram(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_delivery customers_delivery_address_id_f3e68cce_fk_customers_address_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_delivery
    ADD CONSTRAINT customers_delivery_address_id_f3e68cce_fk_customers_address_id FOREIGN KEY (address_id) REFERENCES public.customers_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_delivery customers_delivery_order_id_006f6c75_fk_customers_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_delivery
    ADD CONSTRAINT customers_delivery_order_id_006f6c75_fk_customers_order_id FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_order customers_order_customer_id_032dd871_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_order
    ADD CONSTRAINT customers_order_customer_id_032dd871_fk_customers_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderitem customers_orderitem_order_id_0c19357b_fk_customers_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderitem
    ADD CONSTRAINT customers_orderitem_order_id_0c19357b_fk_customers_order_id FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderitem customers_orderitem_product_id_9189abb4_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderitem
    ADD CONSTRAINT customers_orderitem_product_id_9189abb4_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderitem customers_orderitem_variant_id_d4b3378b_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderitem
    ADD CONSTRAINT customers_orderitem_variant_id_d4b3378b_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderstatushistory customers_orderstatu_changed_by_id_71ca4256_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderstatushistory
    ADD CONSTRAINT customers_orderstatu_changed_by_id_71ca4256_fk_customers FOREIGN KEY (changed_by_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_orderstatushistory customers_orderstatu_order_id_34a07fdc_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_orderstatushistory
    ADD CONSTRAINT customers_orderstatu_order_id_34a07fdc_fk_customers FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_payment customers_payment_order_id_7af7afda_fk_customers_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_payment
    ADD CONSTRAINT customers_payment_order_id_7af7afda_fk_customers_order_id FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_viewedproduct customers_viewedprod_customer_id_8fa665f2_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_viewedproduct
    ADD CONSTRAINT customers_viewedprod_customer_id_8fa665f2_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_viewedproduct customers_viewedprod_product_id_f902dc9b_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_viewedproduct
    ADD CONSTRAINT customers_viewedprod_product_id_f902dc9b_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_wishlist customers_wishlist_customer_id_8554e4f5_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_wishlist
    ADD CONSTRAINT customers_wishlist_customer_id_8554e4f5_fk_customers FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customers_wishlist customers_wishlist_product_id_6788646b_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.customers_wishlist
    ADD CONSTRAINT customers_wishlist_product_id_6788646b_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_customers_customer_id FOREIGN KEY (user_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: notifications_notificationlog notifications_notifi_order_id_275e19e6_fk_customers; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notifications_notificationlog
    ADD CONSTRAINT notifications_notifi_order_id_275e19e6_fk_customers FOREIGN KEY (order_id) REFERENCES public.customers_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_banner products_banner_category_id_6ffcde53_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_banner
    ADD CONSTRAINT products_banner_category_id_6ffcde53_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost products_blogpost_author_id_567d983f_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost
    ADD CONSTRAINT products_blogpost_author_id_567d983f_fk_customers_customer_id FOREIGN KEY (author_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost_related_products products_blogpost_re_blogpost_id_8b6639e4_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_related_products
    ADD CONSTRAINT products_blogpost_re_blogpost_id_8b6639e4_fk_products_ FOREIGN KEY (blogpost_id) REFERENCES public.products_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost_related_products products_blogpost_re_product_id_de7a3b9d_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_related_products
    ADD CONSTRAINT products_blogpost_re_product_id_de7a3b9d_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost_tags products_blogpost_ta_blogpost_id_413833f9_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_tags
    ADD CONSTRAINT products_blogpost_ta_blogpost_id_413833f9_fk_products_ FOREIGN KEY (blogpost_id) REFERENCES public.products_blogpost(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_blogpost_tags products_blogpost_tags_tag_id_195753d7_fk_products_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_blogpost_tags
    ADD CONSTRAINT products_blogpost_tags_tag_id_195753d7_fk_products_tag_id FOREIGN KEY (tag_id) REFERENCES public.products_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_attributes products_category_at_attribute_id_4cd0be2e_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_attributes
    ADD CONSTRAINT products_category_at_attribute_id_4cd0be2e_fk_products_ FOREIGN KEY (attribute_id) REFERENCES public.products_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_attributes products_category_at_category_id_bf20cdc7_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_attributes
    ADD CONSTRAINT products_category_at_category_id_bf20cdc7_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_brands products_category_br_category_id_f3697e5d_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_brands
    ADD CONSTRAINT products_category_br_category_id_f3697e5d_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category_brands products_category_brands_brand_id_fc34923b_fk_products_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category_brands
    ADD CONSTRAINT products_category_brands_brand_id_fc34923b_fk_products_brand_id FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_category products_category_parent_id_3388f6c9_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_parent_id_3388f6c9_fk_products_category_id FOREIGN KEY (parent_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_certificate products_certificate_product_id_7564eb6b_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_certificate
    ADD CONSTRAINT products_certificate_product_id_7564eb6b_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_discount products_discount_category_id_7f843ced_fk_products_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_category_id_7f843ced_fk_products_category_id FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_discount products_discount_product_id_c39a20cb_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_product_id_c39a20cb_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_discount products_discount_promo_campaign_id_22319ff1_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_promo_campaign_id_22319ff1_fk_products_ FOREIGN KEY (promo_campaign_id) REFERENCES public.products_promocampaign(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_discount products_discount_variant_id_0ab210d0_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_discount
    ADD CONSTRAINT products_discount_variant_id_0ab210d0_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_pricehistory products_pricehistor_product_id_1fc0e3fe_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_pricehistory
    ADD CONSTRAINT products_pricehistor_product_id_1fc0e3fe_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_pricehistory products_pricehistor_variant_id_7a8d8d2e_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_pricehistory
    ADD CONSTRAINT products_pricehistor_variant_id_7a8d8d2e_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_brands products_product_bra_product_id_e551c83f_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_brands
    ADD CONSTRAINT products_product_bra_product_id_e551c83f_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_brands products_product_brands_brand_id_283aac29_fk_products_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_brands
    ADD CONSTRAINT products_product_brands_brand_id_283aac29_fk_products_brand_id FOREIGN KEY (brand_id) REFERENCES public.products_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_categories products_product_cat_category_id_27982bed_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_categories
    ADD CONSTRAINT products_product_cat_category_id_27982bed_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_categories products_product_cat_product_id_50ef8156_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_categories
    ADD CONSTRAINT products_product_cat_product_id_50ef8156_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_feature_tags products_product_feature_tags_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_feature_tags
    ADD CONSTRAINT products_product_feature_tags_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product_feature_tags products_product_feature_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_product_feature_tags
    ADD CONSTRAINT products_product_feature_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.products_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productattribute products_productattr_attribute_id_de00002b_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT products_productattr_attribute_id_de00002b_fk_products_ FOREIGN KEY (attribute_id) REFERENCES public.products_attribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productattribute products_productattr_product_id_b9a86828_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT products_productattr_product_id_b9a86828_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productattribute products_productattr_variant_id_e4b8d9e4_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productattribute
    ADD CONSTRAINT products_productattr_variant_id_e4b8d9e4_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productimage products_productimag_product_id_e747596a_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimag_product_id_e747596a_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productimage products_productimag_variant_id_bf70ade8_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productimage
    ADD CONSTRAINT products_productimag_variant_id_bf70ade8_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productvariant products_productvari_product_id_d9c22902_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvariant
    ADD CONSTRAINT products_productvari_product_id_d9c22902_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_productvideo products_productvide_product_id_872fe729_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_productvideo
    ADD CONSTRAINT products_productvide_product_id_872fe729_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_promotionblock_categories products_promotionbl_category_id_80df819f_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_categories
    ADD CONSTRAINT products_promotionbl_category_id_80df819f_fk_products_ FOREIGN KEY (category_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_promotionblock_products products_promotionbl_product_id_ea5f3c1a_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_products
    ADD CONSTRAINT products_promotionbl_product_id_ea5f3c1a_fk_products_ FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_promotionblock_categories products_promotionbl_promotionblock_id_dadbd43e_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_categories
    ADD CONSTRAINT products_promotionbl_promotionblock_id_dadbd43e_fk_products_ FOREIGN KEY (promotionblock_id) REFERENCES public.products_promotionblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_promotionblock_products products_promotionbl_promotionblock_id_e5dfe04c_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_promotionblock_products
    ADD CONSTRAINT products_promotionbl_promotionblock_id_e5dfe04c_fk_products_ FOREIGN KEY (promotionblock_id) REFERENCES public.products_promotionblock(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_review products_review_customer_id_54220657_fk_customers_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_customer_id_54220657_fk_customers_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers_customer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_review products_review_product_id_d933ffa7_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_review
    ADD CONSTRAINT products_review_product_id_d933ffa7_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_reviewimage products_reviewimage_review_id_c90b3860_fk_products_review_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_reviewimage
    ADD CONSTRAINT products_reviewimage_review_id_c90b3860_fk_products_review_id FOREIGN KEY (review_id) REFERENCES public.products_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_stock products_stock_product_id_170f916b_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT products_stock_product_id_170f916b_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_stock products_stock_variant_id_dc51ed5d_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_stock
    ADD CONSTRAINT products_stock_variant_id_dc51ed5d_fk_products_ FOREIGN KEY (variant_id) REFERENCES public.products_productvariant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_warranty products_warranty_product_id_51395474_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products_warranty
    ADD CONSTRAINT products_warranty_product_id_51395474_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\unrestrict j85ekBzQxo5byOAR5eLju3yP3ZxztX1yhKYvYydkaqsSt3wbxAZ0hZRaJzydpqp

