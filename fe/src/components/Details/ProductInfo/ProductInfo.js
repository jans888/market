import { useState, useEffect } from 'react';
import { Row, Tabs, Tab, Image, OverlayTrigger , Tooltip} from 'react-bootstrap';
import { BsHeart, BsHeartFill } from 'react-icons/bs';
import { wishProduct } from '../../../services/productData'
import React from 'react';

function ProductInfo({ params }) {
    const [wish, setWish] = useState(false);

    useEffect(() => {
        if (params.isWished === true) {
            setWish(true)
        } else {
            setWish(false)
        }
    }, [params.isWished, setWish])

    const onHearthClick = () => {
        if (wish === false) {
            wishProduct(params._id)
                .then(res => {
                    setWish(true);
                })
                .catch(err => console.log(err))
        } else {
            wishProduct(params._id)
                .then(res => {
                    setWish(false);
                })
                .catch(err => console.log(err))
        }
    }

    return (
        <>
            <Image className="col-lg-12" src={params.image} rounded />
            <Row>
                <h1 className="col-lg-10 col-sm-10 product-info-heading">{params.title}</h1>
                <span id="heartIconDetails" className="col-lg-1 col-sm-1" onClick={onHearthClick}>
                {params.isAuth && <>
                    {!wish ? (
                        <OverlayTrigger placement="top" overlay={<Tooltip>Add to Wishlist</Tooltip>}>
                            <BsHeart />
                        </OverlayTrigger>
                    )
                        : (
                            <OverlayTrigger placement="top" overlay={<Tooltip>Remove from Wishlist</Tooltip>}>
                                <BsHeartFill />
                            </OverlayTrigger>
                        )
                    }
                </>}

                </span>
            </Row>
            <div id="detailsCardText" className="col-lg-12">
                <Tabs defaultActiveKey="details" transition={false}>
                    <Tab eventKey="description" title="Description" id="tab-details">
                        {params.description}
                        <hr />
                        <p id="description-footer" className="text-muted">Product listed at {params.addedAt}</p>
                    </Tab>
                    <Tab eventKey="details" title="Details" id="tab-details">
                        <br></br>
                        Type of the deal: {params.typeOfDeal}
                        <br></br>
                        Type of the body: {params.typeBody}
                        <br></br>
                        Checkup: {params.checkup}
                        <br></br>
                        Engine volume: {params.volume}
                        <br></br>
                        Engine type: {params.engineType}
                        <br></br>
                        Colour: {params.colour}
                        <br></br>
                        Issue year: {params.issueYear}
                        <br></br>
                        Issue month: {params.issueMonth}
                        <br></br>
                        Mileage: {params.mileage}
                        <br></br>
                        Gearbox type: {params.gearbox}
                        <br></br>
                        Gears: {params.gears}
                        <hr />
                        <p id="description-footer" className="text-muted">Product listed at {params.addedAt}</p>
                    </Tab>
                    {/* <Tab eventKey="aboutSeller" title="About seller">
                        <p>Name: {params.name || "Not specified"}</p>
                        <p>Email: {params.email}</p>
                        <p>Telephone: {params.phone}</p>
                        <p>City: {params.city}</p>
                    </Tab> */}
                </Tabs>
            </div>
        </>
    )
}

export default ProductInfo;