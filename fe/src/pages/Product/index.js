import { Helmet } from "react-helmet";
// ATOMS
import { Product } from "../../components/templates";

export default function ProductPage() {
  return (
    <div className="showInAnimation">
      <Helmet>
        <title>Marketplace - Product</title>
      </Helmet>
      <Product />
    </div>
  );
}
